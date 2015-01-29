From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Jan 2015 11:17:43 +0000 (UTC)
Subject: [Buildroot] [Bug 7844] Lua with hard-float on MIPS by buildroot
	doesn't work
In-Reply-To: <bug-7844-163@https.bugs.busybox.net/>
References: <bug-7844-163@https.bugs.busybox.net/>
Message-ID: <20150129111743.5FB1280E4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7844

--- Comment #5 from Carlos Santos <unixmania@gmail.com> 2015-01-29 11:17:42 UTC ---
This is the expected behavior, as documented on http://www.lua.org/pil/4.2.html

$ rpm -qi lua
Name        : lua
Version     : 5.2.2
Release     : 8.fc21
Architecture: x86_64
Install Date: Wed 03 Dec 2014 06:33:31 PM BRST
Group       : Development/Languages
Size        : 602972
License     : MIT
Signature   : RSA/SHA256, Sun 17 Aug 2014 12:08:57 PM BRT, Key ID
89ad4e8795a43f54
Source RPM  : lua-5.2.2-8.fc21.src.rpm
Build Date  : Sun 17 Aug 2014 11:59:50 AM BRT
Build Host  : buildhw-02.phx2.fedoraproject.org
Relocations : (not relocatable)
Packager    : Fedora Project
Vendor      : Fedora Project
URL         : http://www.lua.org/
Summary     : Powerful light-weight programming language
[...]
$ lua
Lua 5.2.2  Copyright (C) 1994-2013 Lua.org, PUC-Rio
> local var = 12345
> print(var)
nil
> var = 12345
> print(var)
12345
> if 6 > 4 then
>> local var = 12345
>> print(var)
>> end
12345
> 

I'd close this as "not a bug".

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
