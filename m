From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 4 Apr 2017 00:23:05 -0300
Subject: [Buildroot] [PATCH v2] libepoxy: OpenGL EGL and OpenGL ES
 dependencies are mandatory
In-Reply-To: <20170403224659.29408234@free-electrons.com>
References: <20170322115643.48653-1-Vincent.Riera@imgtec.com>
 <20170322225648.5a32abeb@free-electrons.com>
 <ea393b5769dccf6047c895588cab7298@zacarias.com.ar>
 <20170323142827.2dc1af5e@free-electrons.com>
 <a18b94fc97da118b9e5232569b5e09ae@zacarias.com.ar>
 <20170403224659.29408234@free-electrons.com>
Message-ID: <9942388d-e45f-88d2-ec16-1c9f077a6d23@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/04/17 17:46, Thomas Petazzoni wrote:

> Hello,
>
> On Thu, 23 Mar 2017 10:31:58 -0300, Gustavo Zacarias wrote:
>
>> Hi Thomas.
>> The patch is mixing two different "issues":
>> 1) It "fixes" that EGL support, without GLX, requires GLES, which isn't
>> true.
>> 2) It fixes the autobuilder failures that GLX requires EGL - which
>> wasn't the case before (1.3.x versions). I need to consult upstream
>> about this, my guess is that it's probably wrong since EGL isn't a hard
>> requirement for GLX - GLX existed long before EGL did.
>
> Has upstream spoken about this?
>
> The build issue has been there for a long time, so I would really like
> to see it fixed.
>
> Thanks,
>
> Thomas

Hi Thomas.
I haven't heard back from upstream on both pending points for libepoxy 
(clean solution for epoxy with mesa without x11) nor forcing EGL.
IMO EGL isn't a hard requirement for X11 (GLX), i can rework the old 
patch for the new libepoxy and send another pull request to see what's 
up, though i was hoping upstream to clarify before being too annoying 
with pulls.
Regards.
