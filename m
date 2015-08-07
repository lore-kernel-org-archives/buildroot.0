From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Fri, 07 Aug 2015 15:44:58 +0200
Subject: [Buildroot] [PATCH 7/7 v2] mysql: add mariadb galera cluster
 variant
In-Reply-To: <20150710095419.1ec6da31@free-electrons.com>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>	<1436458921-4199-8-git-send-email-sylvain.raybaud@green-communications.fr>	<CAHXCMMKV79jKA9YcA_f6KxWuivKMjP8_zZKjHjAHDU6hgiiXCg@mail.gmail.com>
 <20150710095419.1ec6da31@free-electrons.com>
Message-ID: <55C4B65A.3010804@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thomas, Samuel, all

Back working on this after some time off. I've made some of the fixes
you suggested. I've got a question about this one.

On 10/07/2015 09:54, Thomas Petazzoni wrote:
> Dear Samuel Martin,
> 
> On Thu, 9 Jul 2015 23:56:25 +0200, Samuel Martin wrote:
> 
>> Here is a partial review (inlined).
>> 
>> But, overall, I feel like this implementation (essentially the
>> *.mk file) does not match the Buildroot way of doing things...
>> :-/ Have you look at the virtual package infrastructure [1]?
> 
> Fully agreed. Using the same package for both MySQL and MariaDB
> would make sense if their build system was similar. But it's
> completely different, so it really needs to be two separate
> packages.
> 
> Then, if their client libraries are compatible, so that client 
> applications can use either MySQL or MariaDB with no change, then
> doing a virtual package is indeed the right direction.
> 
> Best regards,
> 
> Thomas
> 

OK I can make a virtual package, that seems to make sense. However,
according to section 17.11.6, it seems that I'll have to patch all
packages that depend on mysql, because there is some special magic to
add in the depender's Config.in, am I right? Is this the way to go?

Cheers,

- -- 
Sylvain Raybaud
www.green-communications.fr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVxLZaAAoJEEkkwl4JtJ9ylCEP/Am9kDIzaEj8fEC+q9pfjq5s
Bxo80/MJrg7jgWGK/82/aaXShAhA0q9MDDB1vwIFKz+jsDiuHcuqWWzrXl0RhNpb
Rlwk+pcJFvBKXBHX0b7p+8etVneAdvlr0avWfkdfNKqo1ARXrpfyp0kmbIaAfjPc
PqgxXK7DlV7inJ6dtvA4ziJ9KAb90P4dG07xmogOfJhFLRujRapaVhEobyeoMdl+
CXUJEJakulxShHTmi7F6JYZyLx2XWsB/O1580I0PszrUniuQjPT7bDWYqX8yABki
pSVpGA20g8k10q3Y3GIE6cY37/YtuazPNIQUZI1WvTzkIrv28qGM73BFJQ6eSrz9
2tHCW0zSYDOZTgxSfjODxhCZJOIYqHKV2X4ZlAiOIAAGXpcOogy+ctGJkNVJF98e
mQsBf0Mb95WZYfJt4DbIGCsSIwFnEuzs6TM7PZBtO6/z6sRFJ7/11zmD9lnezJjD
dhYpXkfMwLTYNkpqJWoIW+KLvi9JenuGKkFW+9e9sumwjFfXSkakEIDWY+mkjUgE
izgNoMB4CBrkwry5H+OsE5VJi+OBsfhEyG8CbV36JZphXgAqNmBde485aRnFHbeb
CgkHklSg1PRYpuILO6CrbP6zjXbpAh/73CMJoL0Ym12ttD/7QcElQW8kiAHIN2P7
4NQVPFV3eMZPmXXofhbu
=2TBq
-----END PGP SIGNATURE-----
