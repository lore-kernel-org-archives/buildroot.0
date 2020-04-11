From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2020 11:49:16 +0200
Subject: [Buildroot] [PATCH 3/8] core/show-info: report install types
 for virtual packages too
In-Reply-To: <20200411104104.6a01dba7@windsurf.home>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
 <df507703c3c71ec7f2f774ee140bcde5cb9a8a5b.1586592741.git.yann.morin.1998@free.fr>
 <20200411104104.6a01dba7@windsurf.home>
Message-ID: <20200411094916.GL29898@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-04-11 10:41 +0200, Thomas Petazzoni spake thusly:
> On Sat, 11 Apr 2020 10:12:28 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > Although virtual packages do not usually install anything, they do
> > participate in the dependency chain, and they also transition smoothly
> > from 'not handled yet' all the way down to 'all set'.
> I'm having a hard time to understand what you mean by:
>   they also transition smoothly from 'not handled yet' all the way down
>   to 'all set'.
> Could you clarify ?

I mean that virtual package, like all other packages, have a sequence of
a few steps that transition the virtual package from "not handled yet"
to "installed and dependencies can start", i.e. virtual packages are:

 1. configured
 2. built
 3. installed in staging (optional)
 4. installed in target (optional)
 5. isntalled in images (optional)

Virtual packages are just packages in this respect. It's just that their
deoendencies are treated specially.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
