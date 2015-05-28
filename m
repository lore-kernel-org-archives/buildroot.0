From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Thu, 28 May 2015 12:55:20 +0200
Subject: [Buildroot] scons and check
In-Reply-To: <11559664.aMO1ZzHy8u@pbouda-kubuntu>
References: <5565DCA4.5040002@green-communications.fr>
 <11559664.aMO1ZzHy8u@pbouda-kubuntu>
Message-ID: <5566F418.5040809@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 28/05/2015 09:47, Peter Bouda wrote:
> Hi Sylvain,
> 
> Am Mittwoch 27 Mai 2015, 17:03:00 schrieb Sylvain Raybaud:
>> 
>> A few packages in buildroot already use scons (exfat,
>> exfat-utils, benejson, gpsd). Their build commands look like
>> this:
>> 
>> FOO_SCONS_ENV = $(TARGET_CONFIGURE_OPTS) FOO_SCONS_OPTS =
>> "prefix=/usr"
>> 
>> define FOO_BUILD_CMDS cd $(@D) && \ $(FOO_SCONS_ENV) \ 
>> CROSS=$(TARGET_CROSS) \ $(SCONS) $(FOO_SCONS_OPTS) endef
>> 
> 
> I had a similar problem recently, I had to change my SConstruct
> file, so that the CROSS variable is actually used in the target
> build process. The lines I added are:
> 
> if 'CROSS' in os.environ: cross = os.environ['CROSS'] 
> env.Append(CROSS = cross) env.Replace(CC = cross + 'gcc') 
> env.Replace(CXX = cross + 'g++') env.Replace(LD = cross + 'ld')
> 
> Best, Peter
> 
> 

Hi

Thank you very much. I think with this I fixed a number of other
problems I had not yet spotted. Scons was indeed looking for things in
the wrong place. However it still cannot find check :) But I think the
SConstruct should be fixed so I'll dig deeper and let you know.

Cheers,

- -- 
Sylvain Raybaud
www.green-communications.fr

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVZvQXAAoJEEkkwl4JtJ9yWRgP/0Z2NxC9z4gKuheX/l/zqhHS
cOhiXt7MMBC4Ae+OoGVTZ9gyvhsV3zEaTwwoWWtCfDOn4C9dfA8McUv9x2UaRW3Y
RfoegRbvD+AF69iduTKcZHqgTNFXxJNkha+VJXng86UN156qsszZh2A2u/y6atG7
B06bveL6rfTo1cJeFDOG7YsKltInS1BfcG4TOZtaf7g9iBuvhLArNXHUbJ4kICEp
B7GESI0c1R2Ja8fVYCvuulPrAa7OAjBC5nMmwubnCVtuMQdIdM2gLjZtoi1roluk
uvSLOIW+kdSjxCEEi4jrbFQIjXcKJ7Yfb0Z2J4zXPiXFwk9m3Vxk2KDCHgtLBbG+
IiL6gHwVSW3tVkZu6qulcQaeB/Al9uroceh2sKgqAP5C5YAji9PKgV3OnFQwEPrJ
UQv/pq/x67FuzU6ccr93BCwn8DGzt3MPj4yGyzzLww3S4V/4BXwMeUADtANgpQ5a
40Nsc6E6FQgS015vf2L7X5FUXiX9Hjetv0F/cF12vDSQMkbydcwEuaf9Q7HTcjc4
/dS5V1n4ZrrbE66VqOozcxQlWGZD/Aboe+Ci+paQIBifJjfqhVb2lO5MPClcd9wh
mNZNfszptCsOOlDVHJOgLL9bM2nRgRij5NJXki4WQlM3gIr8PXUJg9uKi84ovwuQ
sFk2POh4nXCyu4DsfJMT
=cXgN
-----END PGP SIGNATURE-----
