From: Andreas Naumann <dev@andin.de>
Date: Sun, 22 Mar 2020 22:58:19 +0100
Subject: [Buildroot] [PATCH v6 23/28] package/qt5webengine: add
 libXdamage as XCB dependency
In-Reply-To: <2edb848b-0d0f-2c01-edc5-7e412c83ba11@andin.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-24-anaumann@ultratronik.de>
 <20200312091553.5498289b@windsurf>
 <2edb848b-0d0f-2c01-edc5-7e412c83ba11@andin.de>
Message-ID: <f5dd2d50-0edb-6819-5a12-61675c601363@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 16.03.20 23:40, Andreas Naumann wrote:
> Hi,
> 
> On 12.03.20 09:15, Thomas Petazzoni wrote:
>> On Mon, 17 Feb 2020 22:23:45 +0100
>> Andreas Naumann <anaumann@ultratronik.de> wrote:
>>
>>> Fixes a build failure.
>>>
>>> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
>>
>> Could you provide the Buildroot configuration that exhibits the issue?
> 
> it was imx6-sabresd_qt5_defconfig plus everything Qt I could find. See 
> cover letter near the end.
> 
>> I've been trying to create a configuration that builds qt5webengine
>> with X.org enabled, and no matter what I do, the OpenGL provider I use
>> selects libxdamage, so I don't have a configuration that combines
>> qt5webengine and X.org, but without having libxdamage.

I now realize my configuration had mesa3d without 
BR2_PACKAGE_MESA3D_OPENGL_GLX. Once selected, it pulls in libxdamage and 
it gets build before mesa. So the first part of my patch might really 
not be needed.

The second part (the dependency) however is needed because otherwise it 
wont be available in the per-package sysroot of qt5webengine. I guess I 
should have pointed that out in the commit message. Do you want me to 
resend?

> 
> Maybe this was fixed with e79ee3b, I will try again.

So no, this was another issue.


regards,
Andreas




> 
> 
> regards,
> Andreas
> 
>>
>> Also, what was the build failure ?
>>
>> Thanks!
>>
>> Thomas
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
