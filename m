From: Geoff Levand <geoff@infradead.org>
Date: Wed, 02 Mar 2016 17:11:25 -0800
Subject: [Buildroot] [PATCH 3/4] Add go target support
In-Reply-To: <20160302235110.7fe169b2@free-electrons.com>
References: <cover.1456946494.git.geoff@infradead.org>
 <22da8d19ae88ef56544a26541228319c78ae8dea.1456946494.git.geoff@infradead.org>
 <20160302235110.7fe169b2@free-electrons.com>
Message-ID: <1456967485.13916.110.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2016-03-02 at 23:51 +0100, Thomas Petazzoni wrote:
> On Wed, 02 Mar 2016 19:23:33 +0000, Geoff Levand wrote:
> > Add the needed bits to build a go compiler for the target.
> > 
> > Signed-off-by: Geoff Levand <geoff@infradead.org>
> 
> We don't support or want to support doing development on the target, so
> I think the target variant of the go compiler is not needed.
> 
> See
> https://buildroot.org/downloads/manual/manual.html#faq-no-compiler-on-target
> for more details.

If I have read the above document correctly the primary reason
for not having a target side toolchain was concerns
of complexity and maintanence.  I don't think that is the
case with this go package.

My motovation for having a target go is to include the go
tools that can be used for debugging go programs, etc.
Also, for minimal systems it is common to have a Linux
container with the just the go compiler in it, and then
only loading that container when installing a go
program from source.  By having a target go compiler
such a container can be build from buildroot.

See https://hub.docker.com/_/golang/

-Geoff
