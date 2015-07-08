From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  8 Jul 2015 08:24:11 +0300
Subject: [Buildroot] [PATCH 1/2] system/skeleton: remove random-seed
Message-ID: <314559b27c9c888a8939941b1b4ba500f20b4294.1436333052.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Seeding the entropy pool with a known seed makes more harm than good. This is
especially bad for when /etc is not on a persistent writable storage, so the
entropy pool is seeded with the same value on every boot. Just drop it.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 system/skeleton/etc/random-seed | Bin 512 -> 0 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 system/skeleton/etc/random-seed

diff --git a/system/skeleton/etc/random-seed b/system/skeleton/etc/random-seed
deleted file mode 100644
index f26038adc5d057a0b9d6ce5d3cda02ccb4a4d12e..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 512
zcmV+b0{{Iq0UOB42;n<rZ7)sf8Kr=fg87_s+y&vLYgGJP-sY`OWMEj0aQ&I{*g5$)
zH?Zu5*rX8>4xpAvJIL$H4mg*!B4&9jh)7+B2j-fX7o at K*bzj;pJ$FwoQzl&MuZ^Wy
zrYS)x9vq<)#e~&1uB|_ITW-fntEg1^KXs3>vvgL7?_kg!+6=fg{S7mwkr$#pm<zB(
zu)oAUWFK-u-)cWcuSL*8$Q<cmC?ll~NEK@l5k|75(YzZ_p!I6FJ}YI_3>PZ13liCc
zi|M+im&71p*p+Z|7f(m-aedNFtEezFN<xKEd-wQ71%XuGfKr+6VcDycMQ(v6+Z0G|
z-MPjg@JHu%y(|h1cTa=a4(m?GyU)ZD-T+-vLXX}cCXyn}vCXC3Hn1ft`zDTL(};Rr
z?3wX?Eh5%n+AXAeDtXvl!o>-nZHytAhV~}?OM$-f$(%cG(ioV{==Ub4mfZP}OaJJ7
z25tvCcku=>;L?}O-dvK9`}<^gmg@IrnfQm#P>RRF|C9c;GDgEg_bw26{dkIVt1`{`
z3#ol{Q_FL91TBD~{uZn<gw?^=VUuSaIf)=p`07n=>RRZ(Otf!KXM&;q)8B<Q8(T)k
z?Z}a{1Jyf~bQPL{qVQk6jFNfBr)0;57HwN`o6Kw{wdPGHUWrfsJ}0VmW|Tr22whlO
C+W_DI

-- 
2.1.4
