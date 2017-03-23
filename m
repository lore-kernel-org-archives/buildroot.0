From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Mar 2017 10:00:59 -0300
Subject: [Buildroot] [PATCH v2] libepoxy: OpenGL EGL and OpenGL ES
 dependencies are mandatory
In-Reply-To: <20170322225648.5a32abeb@free-electrons.com>
References: <20170322115643.48653-1-Vincent.Riera@imgtec.com>
 <20170322225648.5a32abeb@free-electrons.com>
Message-ID: <ea393b5769dccf6047c895588cab7298@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-03-22 18:56, Thomas Petazzoni wrote:

>> Also, libepoxy use dlsym to load a GLES2 library when EGL support is
>> enabled, see src/dispatch_common.c:
>> 
>> So, OpenGL ES dependency is also mandatory.
>> 
>> Fixes:
>>   
>> http://autobuild.buildroot.net/results/3eca5ba26a521f6cc5a611309ba066472af7769c
>>   
>> http://autobuild.buildroot.net/results/cf9ec7da196d70548ae1413e4a3730314f6434d6
>>   
>> http://autobuild.buildroot.net/results/069b80101afc4719db6d6d41cf5fc923be21ddc0
>> 
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> Reviewed-by: Romain Naour <romain.naour@gmail.com>
>> Tested-by: Romain Naour <romain.naour@gmail.com>
> 
> I would really like to hear about this patch from Gustavo. Gustavo,
> could you review/comment?

Hi all.
According to my tests this isn't a hard requirement - libepoxy builds 
and works fine with just EGL, in fact a PoC is pretty easy, just clone 
http://repo.or.cz/buildroot-gz.git/shortlog/refs/heads/desktop, make 
pc_x86_64_bios_wayland_defconfig, make menuconfig, disable GLES, build 
and the resulting image which is wayland-weston-midori (hence gtk3, plus 
some other gtk3 apps) works just fine.
And by looking at the source i don't see where in dispatch_common.c the 
lack of GLES errors out hard.
Regards.
