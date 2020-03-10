From: Andreas Naumann <dev@andin.de>
Date: Tue, 10 Mar 2020 19:20:18 +0100
Subject: [Buildroot] [PATCH v6 04/28] package/qt5base: Convert to qmake
 infra
In-Reply-To: <20200309232930.71131bb1@windsurf.home>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-5-anaumann@ultratronik.de>
 <20200309232930.71131bb1@windsurf.home>
Message-ID: <b09e63b1-da7b-f9e7-1d94-850fc1095dcb@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 09.03.20 23:29, Thomas Petazzoni wrote:
> Hello Andreas,
> 
> On Mon, 17 Feb 2020 22:23:26 +0100
> Andreas Naumann <anaumann@ultratronik.de> wrote:
> 
>> Convert build, staging and target install to the qmake infra commands.
>> This removes a lot of conditional code because we solely rely on all install
>> rules being properly generated according to the configured options.
>>
>> Of course we keep the configure command/logic as is, because qmake does not
>> yet exist.
>>
>> Handling of the custom qt.conf is now done in the post staging hook.
>>
>> Todo: Check if font install for 5.6 is still working.
> 
> This Todo is no longer relevant, as support for Qt 5.6 has been removed.
> 
>> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
>> ---
>>   package/qt5/qt5base/qt5base.mk | 81 +---------------------------------
>>   1 file changed, 2 insertions(+), 79 deletions(-)
> 
> I've applied this patch to master, after fixing the conflicts when
> applying.
> 
> I also added a preliminary patch that changes pkg-qmake.mk to only add
> qt5base as a dependency when the package is *not* qt5base, to avoid a
> circular dependency.

Ah yes, I didnt think of this when you changed patch 02. Now I'm really 
curious as to what the autobuilders say..

regards,
Andreas


> 
> Thanks!
> 
> Thomas
> 
