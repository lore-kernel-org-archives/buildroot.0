From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 02 Jul 2013 18:46:23 +0200
Subject: [Buildroot] Beaglebone Black support
In-Reply-To: <20130702093415.5db13282@skate>
References: <CA+-urNQPUunJ4se0apcfimNRAK4iq1u_mLaCYRvcPJWS6Uq+HQ@mail.gmail.com>
 <20130623161357.136be827bdb312f43bda51a6@lavabit.com>
 <CA+-urNTKwwCtPZkWaxisFbLWiYCRJA1-5COK-rT8NW3QU+kyZw@mail.gmail.com>
 <20130623214133.6249f43e6e2d8bda20aa971a@lavabit.com>
 <CA+-urNTQxDOjPKMAMgTbpp_i5_oD_z0k44hVzL8gRwfz7u3B3A@mail.gmail.com>
 <20130624124933.e7983d6a3730922581985bf4@lavabit.com>
 <51D155A0.3010205@gmail.com> <51D26E29.6030805@mind.be>
 <20130702093415.5db13282@skate>
Message-ID: <51D303DF.70406@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/13 09:34, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Tue, 02 Jul 2013 08:07:37 +0200, Arnout Vandecappelle wrote:
>
>>    I guess you can download the patches as a tarball, right? Then you
>> should just be able to use the tarball's URL in BR2_LINUX_KERNEL_PATCH
>> and buildroot will extract them from the tarball and apply them all in
>> directory order (or according to the series file, if present). Or does
>> that not work for some reason?
>
> If you look at
> https://github.com/RobertCNelson/linux-dev/tree/am33x-v3.8/patches,
> you'll see that patches are organized in a set of sub-directories, and
> the patch order is defined in a shell script,
> https://github.com/RobertCNelson/linux-dev/blob/am33x-v3.8/patch.sh,
> that has to be executed over a Git kernel tree.
>
> To handle such a bizarre stuff, I don't see any other option that
> adding a new kconfig option to specify a shell script to be executed at
> "patch" time of the kernel, so that one can do whatever funky things
> (s)he wants. That's ugly, but I don't see a nice and generic way of
> handling such a bizarre distribution of kernel code.

  Actually, Xenomai and RTAI are similar. So we could add a config option 
that allows the user to add something to the LINUX_PRE_PATCH_HOOK. But I 
admit, it is getting pretty awkward.

  I think it is easier if someone who cares just forks a linux tree on 
github and applies the patches there.

  Regards,
  Arnout

>
> Best regards,
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
