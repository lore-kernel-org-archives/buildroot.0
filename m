From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Thu, 28 May 2015 14:07:43 +0200
Subject: [Buildroot] scons and check
In-Reply-To: <5566F418.5040809@green-communications.fr>
References: <5565DCA4.5040002@green-communications.fr>
 <11559664.aMO1ZzHy8u@pbouda-kubuntu>
 <5566F418.5040809@green-communications.fr>
Message-ID: <5567050F.9030507@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi all,

I had to fix more things in SConstruct file and pass the proper
extra_sysroot argument to scons but I think I got it working. Thanks
again. I'll submit a bunch of patches for adding check, galera and
mariadb probably next week. Hopefully.

Cheers,

Sylvain

On 28/05/2015 12:55, Sylvain Raybaud wrote:
> On 28/05/2015 09:47, Peter Bouda wrote:
>> Hi Sylvain,
> 
>> Am Mittwoch 27 Mai 2015, 17:03:00 schrieb Sylvain Raybaud:
>>> 
>>> A few packages in buildroot already use scons (exfat, 
>>> exfat-utils, benejson, gpsd). Their build commands look like 
>>> this:
>>> 
>>> FOO_SCONS_ENV = $(TARGET_CONFIGURE_OPTS) FOO_SCONS_OPTS = 
>>> "prefix=/usr"
>>> 
>>> define FOO_BUILD_CMDS cd $(@D) && \ $(FOO_SCONS_ENV) \ 
>>> CROSS=$(TARGET_CROSS) \ $(SCONS) $(FOO_SCONS_OPTS) endef
>>> 
> 
>> I had a similar problem recently, I had to change my SConstruct 
>> file, so that the CROSS variable is actually used in the target 
>> build process. The lines I added are:
> 
>> if 'CROSS' in os.environ: cross = os.environ['CROSS'] 
>> env.Append(CROSS = cross) env.Replace(CC = cross + 'gcc') 
>> env.Replace(CXX = cross + 'g++') env.Replace(LD = cross + 'ld')
> 
>> Best, Peter
> 
> 
> 
> Hi
> 
> Thank you very much. I think with this I fixed a number of other 
> problems I had not yet spotted. Scons was indeed looking for things
> in the wrong place. However it still cannot find check :) But I
> think the SConstruct should be fixed so I'll dig deeper and let you
> know.
> 
> Cheers,
> 
> _______________________________________________ buildroot mailing
> list buildroot at busybox.net 
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

- -- 
Sylvain Raybaud
www.green-communications.fr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVZwUPAAoJEEkkwl4JtJ9ybpYP/RWqEI7Xm7usznKbZMcNQUAR
Hg/KDg9CKEAFzxnyQBWsELu2s/+jz6iosCj6OW78C/hyU8cbAg2mpZ5MUCWidq70
BJyxhuphTUFOnenmwwpKZo2URtrF2oo26a+ofZqHTj+swzHL0WtHO0Bwb81NRiHu
9qPHj4wKxVhscNklqmMG+bl6GqbrHoTgX9ztueJ1kE2AEvz/kpQvB7puJJpvR8Iv
wUDF1NNunWc/xreSgbNqTHNTRHZ+tuEVfd+uegnzaVgys/9dDyXJxWDzgzcgi7nr
gySft4KQ0MX3DJeBGMv527iRkCvVnPWll5dkvHNFcpbxQ8p0YJ1m3NOSAZ9nIzaJ
Y4SuSXZM2Is9pCuAsoHqvoe2rkgdxqScYtq2uNfpxksS2HdxJIFDjczKsUz8a22T
6PznRP+wP/Atr73EeJ2hs9r7ee/URB16fL9sjtoiJf9PwuHzxh7WX3VnBN4/LtKR
esD0pKceyEy+FQMP2ES4ax348qib0F5dxVf6PY05pQKDqi6pU/n1dBftG0JceqNc
/O9fvWuxseZTfFt0s0BGDq7C/U2ZEjKQah8vKKS1o+3yHNO9gtyVqZUFdqFhkMsJ
f45aywJwc/iYNUjgQAIO3NydD2vU+wFUBfVXnxawucA6EvhdmFR9NEXUU3c9YK4H
d7ATcMb1lYa6kVLJn/ja
=YTjt
-----END PGP SIGNATURE-----
