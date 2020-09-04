From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Sep 2020 23:32:31 +0200
Subject: [Buildroot] [PATCH] pycompile: fix .pyc original source file
 paths
In-Reply-To: <20200904212610.GP14354@scaer>
References: <20200904112908.21686-1-julien.floret@6wind.com>
 <20200904212610.GP14354@scaer>
Message-ID: <20200904213231.GQ14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2020-09-04 23:26 +0200, Yann E. MORIN spake thusly:
> On 2020-09-04 13:29 +0200, Julien Floret spake thusly:
> > When generating a .pyc file, the original .py source file path is
> > encoded in it. It is used for various purposes: traceback generation,
> > .pyc file comparison with its .py source, and code inspection.

One more comment I forgot to add:

> > +def is_importable_py_file(fpath):
> > +    if not fpath.endswith('.py'):
> > +        return False

Why do you have this condiiton here...

> > +    return re.match(r'^[_A-Za-z][_A-Za-z0-9]+\.py$', os.path.basename(fpath))

When you already test here that file ends with '.py' ?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
