From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 27 Mar 2016 19:01:12 +0200
Subject: [Buildroot] [PATCH v2 06/18] package/opencv3: bump version to
	3.1.0
In-Reply-To: <69clscxmj.ln2@ID-313208.user.individual.net>
References: <1459070223-5901-1-git-send-email-bernd.kuhls@t-online.de>
 <1459070223-5901-7-git-send-email-bernd.kuhls@t-online.de>
 <CAHXCMMLcd313SJ-JMVRoS4UOhH_FG79g5yv463Y6r4EwgKfrMg@mail.gmail.com>
 <69clscxmj.ln2@ID-313208.user.individual.net>
Message-ID: <CAHXCMMKvEgV2MbMZFpUJVOad5D+Z_qszNkwKMe6D=RzL5Gp9sQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 27, 2016 at 5:53 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> Hi Samuel,
>
> Am Sun, 27 Mar 2016 15:05:42 +0200 schrieb Samuel Martin:
>
>> I would move at least the WITH_VA option somewhere else
>
> ok.
>
>>> -       -DWITH_OPENGL=OFF \
>>> -       -DWITH_OPENMP=OFF \
>> AFAICS, these 2 options still exist (see [2,3]).
>
> Yes, and they are used later on in opencv3.mk:
>
> ifeq ($(BR2_PACKAGE_OPENCV3_WITH_OPENGL),y)
> OPENCV3_CONF_OPTS += -DWITH_OPENGL=ON
> OPENCV3_DEPENDENCIES += libgl
> else
> OPENCV3_CONF_OPTS += -DWITH_OPENGL=OFF
> endif
>
> OPENCV3_CONF_OPTS += -DWITH_OPENMP=$(if $(BR2_GCC_ENABLE_OPENMP),ON,OFF)
>
> Is there a reason why they are disabled in the first place?
Yes, there is reason ;-)

Opencv3 has been done correctly when upgrading from opencv2 [1] (as a
replacement), then opencv has been renamed opencv3 [2] and opencv
reverted back [3]... hence the desync. between these 2 packages...
And since this, I have not taken the time to sync. opencv and opencv3
packages... :-/

The opencv package could benefit from the opengl stuff (as well many
others done for opencv3).
The thing that I don't like with the current OpenMP support is that
its support can only be enabled with internal toolchains, not with
external one (not even with BR toolchain used an external toolchain).

[1] https://git.buildroot.org/buildroot/commit/?id=a9043951b93d206363fd8fda6863fc0259b90858
[2] https://git.buildroot.org/buildroot/commit/?id=3ba8dc3561090c817cdc123d9182b0f0d5d326c0
[3] https://git.buildroot.org/buildroot/commit/?id=ac57d05076d7554d5bf43375cc7269fc0e658acc

Regards,

-- 
Samuel
