From: Michael Burghart <mb@michaelburghart.de>
Date: Tue, 22 Mar 2011 20:35:25 +0100
Subject: [Buildroot] Compiling Apache
In-Reply-To: <4D88C6B3.5010103@free.fr>
References: <4D89170F.7080305@michaelburghart.de> <4D88B94A.1060609@free.fr>
	<4D88BD19.7070901@michaelburghart.de> <4D88C6B3.5010103@free.fr>
Message-ID: <4D88F9FD.104@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Am 22.03.2011 16:56, schrieb Eric BENARD:

>> thanks for your info. Seems pretty weird and more complex than I
>> thought. But how do you integrate those rules into buildroot? I only saw
>> the "standard" autoconf and cmake Makefiles.in the documentation..
>>
> well for that part you will need to ask on the mailing list.

I forgot. I did an strace on that non existing file:

mb at einstein:/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre> strace
./dftables
execve("./dftables", ["./dftables"], [/* 73 vars */]) = -1 ENOENT (No
such file or directory)
dup(2)                                  = 3
fcntl(3, F_GETFL)                       = 0x8002 (flags O_RDWR|O_LARGEFILE)
fstat(3, {st_mode=S_IFCHR|0620, st_rdev=makedev(136, 0), ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
= 0x7f8fa10dc000
lseek(3, 0, SEEK_CUR)                   = -1 ESPIPE (Illegal seek)
write(3, "strace: exec: No such file or di"..., 40strace: exec: No such
file or directory
) = 40
close(3)                                = 0
munmap(0x7f8fa10dc000, 4096)            = 0
exit_group(1)                           = ?

Does anybody understand whats happening here?!


- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNiPn9AAoJEEMkp/gkis191/EH/j7MqbQNNrHWim7ZmKfaEHFm
hR0nBTurG/9xt19Tjg0zW9BdPnWAgIjP2ao+p2VRoaIwPGqj3rLdfLzHgfsg959K
kKYoYprcABEGDDPLMiVDK7PeXCyHbLH6v6oWFf6l6tyStRVvhIlDAUPro5bYAeQD
oBnMiq5u/PXRX5SI3P7/d3qnU+2N8fBWx8XM9Qjn+LRWh8RIxyYtMwvYNg3q7bb7
3zSbVxBtxgNHogHCrtt9bl6+eosXAiHnwaA0EH+pimEkMJohchb8Gntq3/2Gm1TF
92a0dEBCLIjpM7WwyCJ1VmYrVyKxs/hGDw2+WHzJWgr49DTdKygfT/FdVAFm3+Q=
=zzIK
-----END PGP SIGNATURE-----
