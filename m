From: Venu Nayar <venu@nayar.org>
Date: Wed, 17 Sep 2008 10:38:22 -0700
Subject: [Buildroot] Buildroot fails building LTP on PowerPC 32
In-Reply-To: <05BB196AB3DA6C4BBE11AB6C957581FE0FD0D22B@sfo-exch-01.dolby.net>
References: <05BB196AB3DA6C4BBE11AB6C957581FE0FBECF4F@sfo-exch-01.dolby.net>
	<05BB196AB3DA6C4BBE11AB6C957581FE0FD0D22B@sfo-exch-01.dolby.net>
Message-ID: <5F61BB18979D4CFA93D7D93A65209B77@wovensystems.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to use buildroot to build the LTP package for a 32-bit PowerPC
target. Large file systems are also turned off. It fails with the following
errors while compiling fsstress.c. Any suggestions on how to fix this?

Thanks,
Venu

fsstress.c:256: warning: 'struct stat64' declared inside parameter list
fsstress.c:256: warning: its scope is only this definition or declaration,
which is probably not what you want
fsstress.c:269: warning: 'struct stat64' declared inside parameter list
fsstress.c:271: error: expected declaration specifiers or '...' before
'off64_t'
fsstress.c: In function 'main':
fsstress.c:406: warning: implicit declaration of function 'lseek64'
fsstress.c:406: error: 'off64_t' undeclared (first use in this function)
fsstress.c:406: error: (Each undeclared identifier is reported only once
fsstress.c:406: error: for each function it appears in.)
fsstress.c: In function 'doproc':
fsstress.c:705: error: storage size of 'statbuf' isn't known
fsstress.c:713: warning: implicit declaration of function 'stat64'
fsstress.c:705: warning: unused variable 'statbuf'
fsstress.c: At top level:
fsstress.c:953: warning: 'struct stat64' declared inside parameter list
fsstress.c:954: error: conflicting types for 'lstat64_path'
fsstress.c:256: error: previous declaration of 'lstat64_path' was here
fsstress.c: In function 'lstat64_path':
fsstress.c:959: warning: implicit declaration of function 'lstat64'
fsstress.c: At top level:
fsstress.c:1256: warning: 'struct stat64' declared inside parameter list
fsstress.c:1257: error: conflicting types for 'stat64_path'
fsstress.c:269: error: previous declaration of 'stat64_path' was here
fsstress.c:1299: error: expected declaration specifiers or '...' before
'off64_t'
fsstress.c: In function 'truncate64_path':
fsstress.c:1305: warning: implicit declaration of function 'truncate64'
fsstress.c:1305: error: 'length' undeclared (first use in this function)
fsstress.c:1310: error: too many arguments to function 'truncate64_path'
fsstress.c: In function 'dread_f':
fsstress.c:1752: error: 'off64_t' undeclared (first use in this function)
fsstress.c:1752: error: expected ';' before 'off'
fsstress.c:1753: error: storage size of 'stb' isn't known
fsstress.c:1778: warning: implicit declaration of function 'fstat64'
fsstress.c:1813: error: 'off' undeclared (first use in this function)
fsstress.c:1753: warning: unused variable 'stb'
fsstress.c: In function 'dwrite_f':
fsstress.c:1843: error: 'off64_t' undeclared (first use in this function)
fsstress.c:1843: error: expected ';' before 'off'
fsstress.c:1844: error: storage size of 'stb' isn't known
fsstress.c:1893: error: 'off' undeclared (first use in this function)
fsstress.c:1844: warning: unused variable 'stb'
fsstress.c: In function 'getdents_f':
fsstress.c:2053: warning: implicit declaration of function 'readdir64'
fsstress.c:2053: warning: comparison between pointer and integer
fsstress.c: In function 'read_f':
fsstress.c:2191: error: 'off64_t' undeclared (first use in this function)
fsstress.c:2191: error: expected ';' before 'off'
fsstress.c:2192: error: storage size of 'stb' isn't known
fsstress.c:2229: error: 'off' undeclared (first use in this function)
fsstress.c:2192: warning: unused variable 'stb'
fsstress.c: In function 'stat_f':
fsstress.c:2403: error: storage size of 'stb' isn't known
fsstress.c:2403: warning: unused variable 'stb'
fsstress.c: In function 'truncate_f':
fsstress.c:2482: error: 'off64_t' undeclared (first use in this function)
fsstress.c:2482: error: expected ';' before 'off'
fsstress.c:2483: error: storage size of 'stb' isn't known
fsstress.c:2503: error: 'off' undeclared (first use in this function)
fsstress.c:2505: error: too many arguments to function 'truncate64_path'
fsstress.c:2483: warning: unused variable 'stb'
fsstress.c: In function 'write_f':
fsstress.c:2600: error: 'off64_t' undeclared (first use in this function)
fsstress.c:2600: error: expected ';' before 'off'
fsstress.c:2601: error: storage size of 'stb' isn't known
fsstress.c:2630: error: 'off' undeclared (first use in this function)
fsstress.c:2601: warning: unused variable 'stb'
