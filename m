From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 02 Apr 2014 07:53:45 +0200
Subject: [Buildroot] rsync fails to build
In-Reply-To: <1D90109776E04A139DC0C95B4F945F47@JohanW7>
References: <6699457346BD4E4E8F8D768D2249294C@JohanW7>
 <20140329143057.6e6aa65a@skate> <9E4B04B54DB642238FDE42DB9E40DE73@JohanW7>
 <20140329180038.7acf5143@skate> <5CA29710B49644AAA294F0FD9984A1D8@JohanW7>
 <20140329232048.45ced2b2@skate> <F9B5E559611E4C1580A5E85C9C0023A7@JohanW7>
 <20140331102604.49ccba2b@skate> <1D90109776E04A139DC0C95B4F945F47@JohanW7>
Message-ID: <533BA5E9.70505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31/03/14 14:31, Sagaert Johan wrote:
>  
> Dear Thomas
> 
> I have 2 buildroot build trees, since they are run on the same user account they share the same buildroot-ccache directories.
> Could this be a cause of ccache trouble ?

 Yes. Until we solve the compilercheck problem, you should give a
different BR2_CCACHE_DIR for both trees.

 In fact, the same applies if you have different output directories for
the same architecture.

 If the architecture is different, ccache will work OK because the
compiler basename is hashed.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
