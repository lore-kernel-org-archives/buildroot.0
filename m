From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 04 Feb 2014 11:24:22 +0100
Subject: [Buildroot] Advice on new board support
In-Reply-To: <CA+TH9VmdX0iai204KWOjHk4ANqAPr8G00GMRpYJcGf++aAnkbQ@mail.gmail.com>
References: <CA+TH9VmdX0iai204KWOjHk4ANqAPr8G00GMRpYJcGf++aAnkbQ@mail.gmail.com>
Message-ID: <52F0BFD6.4070106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Angelo,

On 02/02/14 22:15, Angelo Compagnucci wrote:
> Hi guys,
> 
> I'm preparing a patch for the Ariag25 SOM and its Terra carrier board
> from http://acmesystems.it.
> I made a working and minimal configuration for Ariag25 SOM in which I
> enabled nothing more than a basic booting system.

 We would really appreciate if you send this config!

> 
> For Terra, on the contrary, I'm building a more complex configuration
> with dhcp, python and various other software, because Terra is a
> carried board for rapid prototyping and the fairly basic configuration
> of the plain simple Ariag25 is pretty useless on that.

 At last year's FOSDEM buildroot developer meeting, we decided to support
this type of scenario (see [1]). The config file should be named
something like ariag25_demo_terra_defconfig.


> 
> I'm aiming for the inclusion of both configurations, but I think the
> Terra one is really too big to be in configs. Right now I created a
> board/acmesystems/ariag25 folder and placed the configuration there.

 Support files should go into that folder, but the defconfig itself
should be in configs/

 Make sure that you submit the ariag25_defconfig and the
ariag25_demo_terra_defconfig as separate patches, and that the first
patch doesn't contain anything that isn't needed by the basic defconfig.

 Thanks a lot!


 Regards,
 Arnout

> 
> Is this the best way to get the patch accepted?
> 
> Thank you in advance!
> 
> Angelo
> 


[1] http://elinux.org/Buildroot:DeveloperDaysELCE2013#Buildroot.config

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
