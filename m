From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jul 2016 10:09:21 +0200
Subject: [Buildroot] perl XS modules
In-Reply-To: <CAGhdn55xFz6+4f46w3OLMwqUGvGv-mVgDLQzg8o07vWMcRQ3Pw@mail.gmail.com>
References: <20160708095910.621ad48a@gmail.com>
 <20160708174043.3e1b7d11@free-electrons.com>
 <CAGhdn55xFz6+4f46w3OLMwqUGvGv-mVgDLQzg8o07vWMcRQ3Pw@mail.gmail.com>
Message-ID: <20160712100921.1bdbf364@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Jul 2016 10:00:41 +0200, Fran?ois Perrad wrote:

> The BR package libxml-parser-perl is a very specific host package which
> works only with the the system perl.
> (The reason is : this packge is heavy used, and we don't want the cost|time
> of the host-perl build)

The question from Arne was not about the host variant of
libxml-parser-perl, but about he target variant.

> All Perl modules (XS or Pure Perl) use the naming scheme :
> perl-module-name.
> For example, the wrapper for libxml2 is perl-xml-libxml.
> All these packages use the BR infrastructure perl-package.

Right, but Arne seems to indicate that when you build a *target* Perl
modules with cross-compiled C code (i.e not a pure Perl module), there
is an ABI compatibility issue, because the host perl and the target
perl don't use the same ABI.

Arne: can you give a specific Buildroot configuration and commands to
test that exhibit the problem?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
