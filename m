From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Dec 2011 09:34:56 +0100
Subject: [Buildroot] [RFC] Python packages
In-Reply-To: <CAAXf6LVwxWepKARkmERWCDJPL9CnvNe1GuNyqoFDv+Un839E6w@mail.gmail.com>
References: <4EE85335.9060109@visionsystems.de> <20111214084639.2a76f2bc@skate>
 <CAAXf6LVwxWepKARkmERWCDJPL9CnvNe1GuNyqoFDv+Un839E6w@mail.gmail.com>
Message-ID: <20111214093456.59d835e7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 14 Dec 2011 09:01:56 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> I think this should depend on what you consider a 'python package'. Is
> a script written in Python a python package? In my opinion it is not.
> With this reasoning, such a script should be under package/scriptname
> and be listed in the relevant menuconfig category. For example,
> 'dstat' is a system monitoring tool written in Python, and I think it
> belongs under "Debugging, profiling and benchmark".

Agreed.

> However, packages that really are extensions, i.e. add functionality
> to the language that can be used by scripts written in that language,
> e.g. serial communication capabilities, could be added in
> package/python-foo as you suggest, and I would put them under a
> language-specific menu in menuconfig. Things like python-mad, dpkt and
> netifaces would fit under this category.

Right.

> My reasoning is that if you as a developer need such a package, then
> you already know that you need a Python interface, and so the step to
> going to the Python menu. But, for scripts like dstat, you typically
> don't care whether it's written in Python or another language and thus
> you don't expect it to be present in the python menu but rather in the
> related category.

Agreed.

For Lua, it's done this way, i.e all Lua extension packages are grouped
in a sub-menu of the Lua interpreter.

For Python, the python-mad and python-serial packages have been put in
their respective topics (Multimedia and Hardware handling I guess).
Would probably be good to move them in a sub-menu of the Python
interpreter.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
