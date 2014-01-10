From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jan 2014 16:35:10 +0800
Subject: [Buildroot] [RFC PATCH 0/2] gitorious helper
In-Reply-To: <CAAXf6LWy3cXCxTLZcPo+pgXeHjNwc2+uVGyJZZLYJ8RP2rCFHA@mail.gmail.com>
References: <1387988339-17460-1-git-send-email-alexandre.belloni@free-electrons.com>
 <CAAXf6LWy3cXCxTLZcPo+pgXeHjNwc2+uVGyJZZLYJ8RP2rCFHA@mail.gmail.com>
Message-ID: <20140110163510.1d2c8d8a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 8 Jan 2014 08:54:37 +0100, Thomas De Schampheleire wrote:

> 1. discuss the situation with the Gitorious people, requesting them to
> provide a downloadable tarball with the name
> <package>-<version>.tar.gz (or whichever extension), like the rest of
> the software world does.

This would be an interesting thing to do, indeed.

> 2. accept the fact that the URL cannot be changed, but modify the wget
> download helper so that it can rename the file after download
> (clarifying the list of files in dl/)
> 
> In the first alternative, the gitorious helper can be a one-liner just
> as for github, and the .mk files only need to specify FOO_SITE.
> In the second alternative, we need to set two variables FOO_SITE and
> FOO_SOURCE. In your current patchset, you have done this with one
> helper that sets both variables. As a result, the usage compared to
> the github helper is fundamentally different.
> For github:
> FOO_SITE = $(call github,username,package,$(FOO_VERSION))
> while for gitorious:
> $(call gitorious,username,package,$(FOO_VERSION)
> 
> I don't like this difference, and suggest two alternatives:
> A. split the helper in two, so that:
> FOO_SITE = $(call gitorious-site,username,package,$(FOO_VERSION))
> FOO_SOURCE = $(call gitorious-version,username,package,$(FOO_VERSION))

I very much prefer this solution. I don't really like the helper that
magically defines FOO_SITE and FOO_VERSION.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
