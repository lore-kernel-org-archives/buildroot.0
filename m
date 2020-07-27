From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 21:33:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/cli11: new package
In-Reply-To: <20200727212345.2d650692@windsurf.home>
References: <20200706111715.46462-1-aleksandr.o.makarov@gmail.com>
 <20200727212345.2d650692@windsurf.home>
Message-ID: <20200727193329.GK19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-07-27 21:23 +0200, Thomas Petazzoni spake thusly:
> On Mon,  6 Jul 2020 05:17:15 -0600
> Aleksandr Makarov <aleksandr.o.makarov@gmail.com> wrote:
[--SNIP--]
> > +ifeq ($(BR2_PACKAGE_CLI11_SINGLE_FILE),y)
> > +CLI11_CONF_OPTS += -DCLI11_SINGLE_FILE=ON \
> > +                   -DCLI11_INSTALL=OFF
> > +CLI11_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
> > +endif
> 
> Overall, wouldn't it be simpler to simply use the pre-generated single
> header file that the upstream project provides at
> https://github.com/CLIUtils/CLI11/releases ?
> 
> For example
> https://github.com/CLIUtils/CLI11/releases/download/v1.9.1/CLI11.hpp
> for the latest release. Is there any drawback in doing this ?

Yes: the header is not versionned. So if we update, we'll end up with
another CLI11.hpp which content is different.

This will cause issues for users, as they would need to re-download if
they need to support two versions of Buildroot (.g. for an old and a new
project using two different Buildroot version), adn for us, as we could
not host both version in s.b.o.

Of course, we could download it "manually" as a post-doenload hook, and
rename the cached file, but meh... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
