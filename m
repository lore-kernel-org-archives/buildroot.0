From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Jan 2014 09:22:49 +0100
Subject: [Buildroot] [PATCH 5/6] pkg-infra: add possiblity to check
 downloaded files against known hashes
In-Reply-To: <20140114233438.GL3328@free.fr>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <dc5d6ba62805a74ef57fc2c779e97a00056cbfa6.1389569992.git.yann.morin.1998@free.fr>
 <52D5AE11.60804@mind.be> <20140114233438.GL3328@free.fr>
Message-ID: <52D64559.90705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/01/14 00:34, Yann E. MORIN wrote:
> Arnout, All,
>
> On 2014-01-14 22:37 +0100, Arnout Vandecappelle spake thusly:
>> On 13/01/14 00:44, Yann E. MORIN wrote:
[snip]
>>> Note-2: The laternative to sha1 would be sha2 (256- or 512-bit), but
>>> oldish "enterprise-class" distributions  may be missing them entirely.
>>> sha256sum and sha512sum were added to coreutils in 2005-10-23, and RHEL5
>>> seems to have them. But better be safe than sorry. If sha2 should be
>>> considered instead of sha1, then it is very easy to switch now. Switching
>>> later would require that we revalidate all packages that have hashes,
>>> which could prove to be quite time-demanding if we have lots of
>>> packages using hashes.
>>
>>   We can be more future-safe by storing the hash that is used in the .hash
>> file itself.
>
> Hu?

  If the hash file contains the following:

486fb55c3efa71148fe07895fd713ea3a5ae343a  sha1  libfoo-1.2.3.tar.bz2

then you can now let the script check that the second field is sha1, and 
later you can support different hash methods. In that case, it is not 
necessary to update all the files when we want to switch to a new hash 
method.

  (Incidentally, it also enables Gustavo's suggestion to use whatever 
upstream provides.)

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
