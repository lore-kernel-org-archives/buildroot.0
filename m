From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 14 Feb 2014 09:58:32 +0100
Subject: [Buildroot] [PATCH v12 7/7] sdl: add support for top-level
 parallel make
In-Reply-To: <20140213155206.25f1d51b@skate>
References: <1392196751-23485-1-git-send-email-fabio.porcedda@gmail.com>
 <1392196751-23485-8-git-send-email-fabio.porcedda@gmail.com>
 <20140213155206.25f1d51b@skate>
Message-ID: <CAHkwnC-XAqY9JiQBPqxaT8gkSh1oUVmVKyv_QO7Eq5kN6jCyAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 13, 2014 at 3:52 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Wed, 12 Feb 2014 10:19:11 +0100, Fabio Porcedda wrote:
>> Add host-autoconf as a dependency of the sdl-patch target because is
>> used by it.
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> ---
>>  package/sdl/sdl.mk | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
>> index ba5fbca..701022b 100644
>> --- a/package/sdl/sdl.mk
>> +++ b/package/sdl/sdl.mk
>> @@ -80,3 +80,6 @@ endef
>>  SDL_POST_INSTALL_STAGING_HOOKS += SDL_FIXUP_SDL_CONFIG
>>
>>  $(eval $(autotools-package))
>> +
>> +# autoconf is used in the sdl-patch target
>> +$(SDL_TARGET_PATCH): | host-autoconf
>
> I believe I'd prefer if the SDL autogen stuff was done as a
> pre-configure hook, since this is the hook that is used in the package
> infrastructure to run autoreconf in the normal case.

It's a nice idea, so i will do just this:

SDL_PRE_CONFIGURE_HOOKS += SDL_RUN_AUTOGEN

> Cc'ing Maxime Hadjinlian, who has recently worked on SDL :)

Thanks and best regards
-- 
Fabio Porcedda
