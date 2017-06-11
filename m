From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Jun 2017 23:33:27 +0200
Subject: [Buildroot] [PATCH 02/14] package/irrlicht: new package
In-Reply-To: <007c55a8-b229-7d5d-1a73-c81057d53ca7@gmail.com>
References: <20170411222643.9770-1-romain.naour@gmail.com>
 <1108a7ef-12c0-8e55-1a6f-22f9b4bae251@t-online.de>
 <007c55a8-b229-7d5d-1a73-c81057d53ca7@gmail.com>
Message-ID: <cba4449d-096e-a698-c55e-6a2c52c9048d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-06-17 23:09, Romain Naour wrote:
> Hi Bernd,
> 
> Thank for the review, it's very appreciated :)
> 
> Le 11/06/2017 ? 18:54, Bernd Kuhls a ?crit :
>> Hi Romain,
>>
>> afaics the irrlicht package only provides libirrlicht.so.
>> What about naming the package libirrlicht and move it to
>> "Target packages > Libraries > Graphics"?
> 
> Make sense even if irrlicht is the upstream name.
> In the past, I hesitated to do so for efl package which can be named libefl.

 No, in Buildroot, we always use the upstream name (except for python-* etc.).

[snip]
>>> +# Bundled libraries: bzip2, libaesGladman, libpng, lzma, zlib,
>>> +IRRLICHT_LICENSE = bzip2 license, jpeg-license (BSD-3-Clause-like), Libpng, Zlib
>>
>> Please mention the license of the irrlicht package itself.
> 
> Irrlicht itself use Zlib license.

 Then Zlib license should be first, and the license of the bundled libraries
should mention which bit they apply to between brackets.

 By the way, could you mention in the commit message why unbundling is not possible?

 Regards,
 Arnout

> 
> http://pkgs.fedoraproject.org/cgit/rpms/irrlicht.git/tree/irrlicht.spec#n9
> 
> Best regards,
> Romain
> 
>>
>> Regards, Bernd
>>
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
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
