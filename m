From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 09:39:03 +0200
Subject: [Buildroot] Buildroot runtime test infrastructure prototype
In-Reply-To: <55923FF1.4010700@andin.de>
References: <558D745D.6010606@andin.de>
 <499323654.2188387.1435335633378.JavaMail.root@openwide.fr>
 <20150628115001.098430d1@free-electrons.com>
 <55923FF1.4010700@andin.de>
Message-ID: <20150630093903.4fd27ca5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas,

On Tue, 30 Jun 2015 09:06:25 +0200, Andreas Naumann wrote:

> RFW also runs plain Python code, the only difference is, it does it 
> exclusively via its internal, external or user-written libraries. The 
> libraries are simply Python classes with function calls like 
> open_connection(self, host, port=23, prompt, ...) or 
> execute_command(self, command, loglevel=None) .
> In the RFWs tabular format this then looks like
> Open Connection | 192.168.0.37 | prompt=[root]#
> Login           | root         | pw
> Execute Command | echo Hello World
> 
> which in an HTML table is quite readable. RFW calls it keywords. You can 
> also create custom keywords consisting of any other keywords.
> So while the libraries are the equivalent of the fixtures that Thomas S. 
> was talking about, you can group keywords that form certain steps into 
> domain specific resource files, like filesystem, package, qemu...
> Using those higher level keywords you then can hide the lengthy 
> parameter set from the top level testcase table, which leads e.g. to 
> something like:
> Buildroot.Add Package To Defconfig | dropbear
> Buildroot.Compile
> Qemu.Start System
> Telnet.Connect And Login
> Command Output Should Contain | netstat -ltn 2 | 0.0.0.0:22
> 
> There is another resource type, Variables, which allows for 
> configuration of keywords and testcases but before explaining any 
> longer, I'll try to come up with a working example...

Thanks a lot for giving more details about this. Indeed having a
working example would be nice. However, I'm not entirely convinced this
higher-level tabular format is really much more readable/useful than a
pure Python solution. This higher-level tabular format remains in any
case more limited than a real programming language, and it's a special
syntax you have to learn, while Python is known by a large number of
people already.

But maybe I would be more convinced by some other features of RFW. What
are its reporting capabilities? Can it run tests in parallel? Can we
easily integrate the tests with Jenkins to have them run everyday?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
