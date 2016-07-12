From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Tue, 12 Jul 2016 11:43:49 +0200
Subject: [Buildroot] perl XS modules
In-Reply-To: <20160712110438.62d56296@gmail.com>
References: <20160708095910.621ad48a@gmail.com>
 <20160708174043.3e1b7d11@free-electrons.com>
 <CAGhdn55xFz6+4f46w3OLMwqUGvGv-mVgDLQzg8o07vWMcRQ3Pw@mail.gmail.com>
 <20160712101554.483fd170@gmail.com>
 <20160712105624.58817034@free-electrons.com>
 <20160712110438.62d56296@gmail.com>
Message-ID: <CAGhdn54OkaYbb_WguDYBsdqkkOFXxA2rAsmSLYT_EL--qRGS7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arne,

Could you try to build a package like perl-gd or perl-net-ssleay, in order
to verify your infrastructure ?
These packages are known to build on autobuild.buildroot.net .

Fran?ois


2016-07-12 11:04 GMT+02:00 Arne Caspari <arne.caspari@gmail.com>:

> Am Tue, 12 Jul 2016 10:56:24 +0200
> schrieb Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> >
> > Again, could you give a Buildroot configuration, and a test scenario
> > that allows us to reproduce the issue ?
> >
>
> Thomas,
>
> for me the following steps reproduce the issue:
>
> support/scripts/scancpan XML-Parser
> [Enable the perl-xml-parser module in the config]
> make
>
> Then on the target:
>
> perl -e "require XML::Parser"
>
>
> The buildroot configuration should not matter as long as the target has
> a different architecture (eg: ARM ). If it is the same architecture as
> the host, it could produce binary compatible modules by accident.
>
> You could even verify the presence of this issue by just compiling the
> perl-xml-parser module (any architecture): If you look at the build
> output, you will see that the Makefile uses the configuration and
> destination paths of the host perl.
>
> /Arne
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160712/ed41024a/attachment.html>
