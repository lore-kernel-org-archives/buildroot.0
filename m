From: Andreas Naumann <dev@andin.de>
Date: Tue, 18 Feb 2020 11:00:07 +0100
Subject: [Buildroot] [PATCH v6 09/28] package/quazip: Convert to qmake
 infra
In-Reply-To: <20200217225752.74c34031@windsurf>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-10-anaumann@ultratronik.de>
 <20200217225752.74c34031@windsurf>
Message-ID: <d138dcb2-3946-c711-d8ee-a7491bf5979b@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am 17.02.20 um 22:57 schrieb Thomas Petazzoni:
> On Mon, 17 Feb 2020 22:23:31 +0100
> Andreas Naumann <anaumann@ultratronik.de> wrote:
> 
>> We need to use correct staging path as prefix after switching to qmake infra,
>> because the qmake infra no longer overwrites the built in install pathes.
>>
>> Otherwise the build breaks when the install steps are trying to copy to /usr.
>>
>> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> 
> A prefix of $(STAGING_DIR)/usr looks wrong, as prefix is normally where
> the things will be once installed in the target. Do we really need to
> do this change?

I agree it's probably not how PREFIX is intended to be used. But after 
all the project doesnt seem to support cross-compile/install properly as 
you can see by the need to explicitly set INSTALL_ROOT to a different 
path for staging/target.

I had an earlier solution where I made a patch to the quazip .pro file, 
but I wasnt entirely sure if it's correct. So I figured with this 
solution I dont need to do any upstream work ;-), which I'm not 100% 
sure about.


Andreas

> 
> Thanks,
> 
> Thomas
> 
