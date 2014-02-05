From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Feb 2014 23:25:33 +0100
Subject: [Buildroot] Integrating ROS in buildroot ?
In-Reply-To: <52F2700A.2000304@wanadoo.fr>
References: <52F2700A.2000304@wanadoo.fr>
Message-ID: <52F2BA5D.201@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/14 18:08, Thierry Bultel wrote:
> Hi,
> 
> I am currently working on a project where the is a need for ROS
> (http://www.ros.org/) on the target.
> ROS is currently no part of buildroot packages. It is part of
> Yocto/OpenEmbedded, though.
> 
> I am attempting to integrate it, so my first question is if someone-else
> already has plan to do so.
> 
> My second question is related to one hard point to achieve it:
> ROS git repository (see: https://github.com/ros/ros_comm) is composed of
> -many- subdirectories, that have to be built with cmake each.
> 
> Cloning the repos each time, for building these directories one by one
> would be inefficient, and painful, because I do not want
> to have such a package granularity.
> The other issue is that the current cmake infrastructure does not support
> multidir build (yet). So I as thinking about extending it,
> but again, would like to be sure if there no other way to to so.

 Glancing at their build instructions, it looks like they have their own
build infrastructure. So perhaps you just need to create some of the
support packages and then some infrastructure to use it?


 Anyway, if you want to build from git, you can define the SITE and
SOURCE in a common place like it is done for e.g. qt5, and then create
individual packages with the same SITE and SOURCE but with a different
SUBDIR. Then the whole thing will be downloaded only once, but it will
still be extracted several times.

 Regards,
 Arnout

> 
> Regards
> Thierry
> 
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
