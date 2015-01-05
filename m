From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 5 Jan 2015 12:05:38 +0100
Subject: [Buildroot] [PATCH] svgtiny: update source url
In-Reply-To: <CAHkwnC9yUAK_Oq4Xr_gP5FsPU8Cw_Sa+g2gzTzHnYV3Y+yaxfQ@mail.gmail.com>
References: <1420018280-28316-1-git-send-email-fabio.porcedda@gmail.com>
 <20141231180633.000dea5e@free-electrons.com>
 <CAHkwnC9yUAK_Oq4Xr_gP5FsPU8Cw_Sa+g2gzTzHnYV3Y+yaxfQ@mail.gmail.com>
Message-ID: <CAHkwnC_wzqDop0spZACLNoQvJrzXaPUNQHoJpjhPT1OPyt-BoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 1, 2015 at 7:01 PM, Fabio Porcedda <fabio.porcedda@gmail.com> wrote:
> On Wed, Dec 31, 2014 at 6:06 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Fabio Porcedda,
>>
>> On Wed, 31 Dec 2014 10:31:20 +0100, Fabio Porcedda wrote:
>>> As source url use the git repository instead of the unavaiable svn
>>> repository.
>>>
>>> This fix the following error:
>>>
>>> svn: E670002: Unable to connect to a repository at URL 'svn://svn.netsurf-browser.org/trunk/libsvgtiny'
>>> svn: E670002: Unknown hostname 'svn.netsurf-browser.org'
>>>
>>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>>> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>> ---
>>>  package/libsvgtiny/libsvgtiny.mk | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> In the end, I reverted your change, it was causing build failures since
>> some files are apparently missing from the Git repository. See
>>
>>   http://autobuild.buildroot.org/results/242/24257e9739df8f589150336cb6213812516bf465/
>>
>> Can you have a look?
>
> I'm sorry, I will look at it.
>
> BR
> --
> Fabio Porcedda


I've sent an updated patch:
http://patchwork.ozlabs.org/patch/425275/

The problem was related to missing files part of the "netsurf core
buildsystem" that aren't present in the libsvgtiniy git repository so
i added those files as a patch.

BR
-- 
Fabio Porcedda
