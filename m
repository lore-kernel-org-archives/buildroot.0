From: David J. Fogle <Dave@exitstrategytech.com>
Date: Thu, 6 Dec 2018 02:16:43 +0000
Subject: [Buildroot] Docker client does not function correctly in 2018.11
In-Reply-To: <CA+h8R2oK2mPefnBQ9c-jd7m4Tc7=s-0nsCV965r9DpsVTULuaA@mail.gmail.com>
References: <ac041379a2d04fbeb3900fae7bab51be@exitstrategytech.com>
 <8dcf0b32c7fe49e8b30b10a482f3f23a@exitstrategytech.com>
 <CA+h8R2pH=BTTh+farCMfJOW8dzYsUhN_ompMtc=Aaz4tQVbVXg@mail.gmail.com>
 <5db9d4aa533e4e8590b5c33d2bb47665@exitstrategytech.com>
 <p05ed2odjpa9vgdmd5cx9cew.1544054248971@email.android.com>
 <CA+h8R2orLF5mjc6g8qDwG5Sh0WMXicnLb9DTB_qQiTBoJd45yA@mail.gmail.com>
 <6e255ac5c09e4841ac67d6f383249556@exitstrategytech.com>
 <99kkgapwmjckouvyyw5vo6pe.1544060571584@email.android.com>
 <CA+h8R2oK2mPefnBQ9c-jd7m4Tc7=s-0nsCV965r9DpsVTULuaA@mail.gmail.com>
Message-ID: <ec3f3d11856642d09f7a59f5d1fe3dbd@exitstrategytech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the advice. I have to put my kernel builder hat on for the first time in a while it seems. I have configured the kernel according to the recommended settings in the Gentoo handbook, and am trying again. After a build with overlay enabled, I was able to get docker to run far enough along to complain about cgroup support lacking, so I think that the skiff builds are fixed, I will reply with verification as soon as I download the image from the build server.

Thank you for your help, if you represent even 1 percent of the contributors to buildroot, I imagine this project is worth me investing time into it. So far, this has been an amazing journey.  

-----Original Message-----
From: Christian Stewart <christian@paral.in> 
Sent: Wednesday, December 5, 2018 7:47 PM
To: David J. Fogle <Dave@exitstrategytech.com>
Cc: Christian Stewart <christian@paral.in>; Matthew Weber <matthew.weber@rockwellcollins.com>; Hamilton Southworth <hamilton@aperturerobotics.com>; buildroot at busybox.net
Subject: Re: Re: Re: Docker client does not function correctly in 2018.11

Hi David,

On Wed, Dec 5, 2018 at 5:42 PM David J. Fogle <Dave@exitstrategytech.com> wrote:
> Ok, after adding in overlay, I am closer I think. One more kernel build with cgroup support. Is there any form of official documentation on docker and buildroot, or is it shoot first ask questions later?

There is no official documentation at this point, the Docker package exists as a "include the Docker binaries in my target system" minimal option in Buildroot, and developers are currently left to decide how to configure it themselves.

If you want to see how I use Docker and Buildroot as a reference, see https://github.com/paralin/SkiffOS.git - feel free to open issues there as well if you have Docker related questions / other non-Buildroot specific topics to discuss.

The minimal requirements for Docker are a kernel compiled with a specific set of features enabled (see the Docker documentation) as well as some init process to start the daemon at system startup.

Best regards,
Christian Stewart
