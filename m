From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Nov 2018 20:00:58 +0100
Subject: [Buildroot] [PATCH 2/3] graph-depends: split off
 get_version/get_depends into pkgutil.py
In-Reply-To: <79d703e1-ef04-030a-cf03-3386e7f890f6@mind.be>
References: <20170203205745.14488-1-patrickdepinguin@gmail.com>
 <20170203205745.14488-4-patrickdepinguin@gmail.com>
 <20181107180753.GA4702@scaer>
 <CAAXf6LVC==B0Rb7-ZpDh=k2VyF4UJZYaamQ0hhhZzpS6z=Syrg@mail.gmail.com>
 <20181107193903.GC4702@scaer>
 <0bc9de12-ac88-89ad-c48b-06c75c475e16@mind.be>
 <20181107224512.GF4702@scaer>
 <79d703e1-ef04-030a-cf03-3386e7f890f6@mind.be>
Message-ID: <20181111190058.GA10271@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-11-08 09:01 +0100, Arnout Vandecappelle spake thusly:
> On 07/11/18 23:45, Yann E. MORIN wrote:
> >> def get_dependency_tree(backward: bool = True) -> Dict[str, Package]:
> > Just for my own understanding: what syntax is that? I was trying to write
> > the protoype of the function, but in Python there is no prototype where
> > you can explain the return type. Yours seems like it is what I was
> > looking for. Is it described somewhere?
>  For documentation, I'll refer to PEP 484 [1].

ACK, thanks. :-)

[--SNIP--]
> > But let me bikeshed in turn: I would make your proposed
> > 'host' field an enum instead,
> 
>  Python enums require an external package that we can't assume is installed. But
> I suppose you didn't mean an actual enum :-P

Yeah, I knew, I was thinking 'emulated' enum, as class-level constants, like:

    class Package():
        T_UNKNOWN_PKG = 0
        T_HOST_PKG = 1
        T_TARGET_PK = 2
        [...]

and then refer to them as Package.T_HOST_PKG etc...

(but of course, they are not constant! they are just class-variables
with default values.)

> > Dang, I'm always getting side-tracked into side topics. All I wanted was
> > a faster graph-depends, and it's already there now! Sob... ;-)
>  Feel free to ignore my feedback! I'll take progress over perfection any time.

Eh! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
