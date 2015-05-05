From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Tue, 05 May 2015 12:31:01 +0200
Subject: [Buildroot] integrating MariaDB Galera Cluster into BR
In-Reply-To: <20150424175438.GG4244@free.fr>
References: <553A5805.3080701@green-communications.fr>
 <20150424175438.GG4244@free.fr>
Message-ID: <55489BE5.6070402@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi

Thanks for your fast reply! Sorry mine is late, I was on vacation.

On 24/04/2015 19:54, Yann E. MORIN wrote:
> Sylvain, All,
> 
> On 2015-04-24 16:49 +0200, Sylvain Raybaud spake thusly:

>> a) Create a meta-package, for example "mysql compatible DB", the 
>> selection of which would let the user choose between MariaDB
>> Galera Cluster or MySQL?
>> 
>> b) Integrate MariaDB Galera Cluster into MySQL package and let
>> the user choose which implementation he wants?
>> 
>> c) Make these packages mutually exclusive using "depends on !"?
> 
> I would say either b) or c). Which one depends on how MariaDB
> Galera is seen with respect to MySQL:
> 
> 1- is it a completely different implementation that is 100%
> compatible?
> 
> 2- is it a fork that is 100% compatible?
> 
> 3- is it a fork that is not 100% compatible?
> 
> For 1 or 2, I'd say go with b), otherwise go for c).

MariaDB is supposed to be a "drop-in replacement for MySQL" so I
suppose I should go for b).
https://mariadb.com/kb/en/mariadb/mariadb-vs-mysql-compatibility/
lists some differences but it seems that everything you can do with
MySQL you can do with MariaDB.

Does option b) allow dependencies specific to MariaDB?

> 
> If you decide for c), then only one can depend on not the ther 
> (otherwise you'd have a crcular dependency). That is, something
> like:
> 
> config BR2_PKG_MYSQL bool "mysql"
> 
> config BR2_PKG_MARIADB bool "mariadb" depends on !BR2_PKG_MYSQL
> 
> Anyway, if you're not sure, go for c); we will review the patch,
> and we can guide you based on the details.
> 
> in any case, be sure to read:
> 
> - the section(s) from the "Adding new packages to Buildroot"
> chapter, that applies to mariadb (e.g. generic, autotools,
> cmake...): 
> http://buildroot.net/downloads/manual/manual.html#adding-packages
> 
> - the section on how to send patches: 
> http://buildroot.net/downloads/manual/manual.html#submitting-patches

Doing
> 
so now. Thanks again!

Sylvain

> 
> Happy hacking! ;-)
> 
> Regards, Yann E. MORIN.
> 

- -- 
Sylvain Raybaud
www.green-communications.fr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVSJvlAAoJEEkkwl4JtJ9ybe0QAIEH9Yx2Y8Wxoqb+XXpjTjAE
9BLu/ev4h9lyBCvQkYjmeM/0pwU0atUTazEfNMVV/sJFsO5FmoC/jddNuPznHFcc
XPcWynMmhjDGlPSBGgY7wqWV1UCvZ5GOmPUJlQsehAq1QLQpzGoV00FJ33xl5roF
Lk8ugiWIMldvqTrjsnsmsCwvxnYFO02fEYJFpEeGmemMdFP0aCsJvSKXuo3ETxGp
ajMluiqiqNAiQnj/s33ZtytxOtbp7LjDnQ6qDIFA4/UjdXh9QTWBvvLlGuoRDboR
iNvHeksSBzsW8AmgUeL3qwurMPPpaOY8qI+rRo6LtfGOPmXvltKaUxK1jFH+4V1D
buG87tUXp3dGeg91WJP46GC+DbsSjm1ygzFH3Nsxtyj5zFVNXw7QmsjtFpgPpIRN
uTW4Ks80pwFn8FAZ14NpHPVgB3t58yskHmMzvN1Fbb+/82G2xU77hgWmXUVOTTyo
EWzdZwlhZ3g/Xv4nqHXGmLRnIqspwOh/+UDekZc3YT5PwbERYAZTfMztarLc83aq
0VlYzAJyWcGRcTH+IOom+ZExanIpSfgfWIMD2nLl6xW/Vqn8/9iiPI2+u04ByZlu
GcE8mK2yE68kHLWjQrfe/MBe+jQCOlptm4NaXo7n6Iv2V5YzWcR/+fLIlNg3+qXf
8cMwqBnt8FGwblLrv9rm
=R/jW
-----END PGP SIGNATURE-----
