From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Thu, 13 Mar 2014 00:18:17 -0400
Subject: [Buildroot] [PATCH v5 3/6] mesa3d: modularize and bump to
 version 10.0.3
In-Reply-To: <1dp6vaxn6k.ln2@ID-313208.user.individual.net>
References: <1394564029-528-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP1419F6C427A11CAB6AF9F7ED9770@phx.gbl>
 <531F84DE.5080005@savoirfairelinux.com>
 <1dp6vaxn6k.ln2@ID-313208.user.individual.net>
Message-ID: <53213189.7070003@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi bernd,

On 03/12/2014 03:33 PM, Bernd Kuhls wrote:
> Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/
> @public.gmane.org> wrote in news:531F84DE.5080005 at savoirfairelinux.com:
>
>> I didn't catch it before, but the shared-glapi option is required by GBM
>> (so by EGL) when you use a DRI driver, perhaps you could add a
>> conditionnal statement in your "ifeq
>> ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)" or always enabled it when you use
>> a DRI driver, i don't know if it can be a trouble to let this option
>> enabled as default.
> Hi,
>
> mesa3d configure.ac:
>
>> # Shared GLAPI is only useful for DRI
>> if test "x$enable_dri" = xno; then
>>   AC_MSG_NOTICE([Shared GLAPI is only useful for DRI, disabling])
>>    enable_shared_glapi=no
>> fi
> Therefore I moved the -shared-glapi option to ifeq ($(MESA3D_DRI_DRIVERS-y),)
>
> Regards, Bernd
It's ok for me,
i will review your new patch set soon.

Regards,
Sebastien.
