From: Cam Hutchison <camh@xdna.net>
Date: Fri, 22 Apr 2016 11:09:50 +1000
Subject: [Buildroot] [PATCH v3 1/3] go-bootstrap: new host package
In-Reply-To: <20160420230245.2e5629d4@free-electrons.com>
References: <cover.1459798147.git.geoff@infradead.org>
 <86c84005b36e17359c5d2a72c0544a738df8f456.1459798147.git.geoff@infradead.org>
 <20160420230245.2e5629d4@free-electrons.com>
Message-ID: <20160422010950.GA28839@xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

>On Mon, 04 Apr 2016 19:31:49 +0000, Geoff Levand wrote:
>> Add a new package go-bootstrap which builds a bootstrap compiler for the
>> go programming language.
>> 

>I've applied to master after doing the following changes:

>    [Thomas:
>     - Rename GO_BOOTSTRAP_FINAL to HOST_GO_BOOTSTRAP_ROOT. Use the HOST_
>       prefix because this variable is specific to the host variant. And
>       it's not "final" at all, but rather the "root" of the Go Bootstrap
>       installation.
>     - Rename GO_BOOTSTRAP_MAKE_ENV to HOST_GO_BOOTSTRAP_MAKE_ENV, also to
>       have the HOST_ prefix because it's a host package.]

I just started playing with these patches a few days ago and made a local
change to this patch that made sense to me - I removed the
HOST_GO_BOOTSTRAP_INSTALL_CMDS because I did not see that it was useful
to have the bootstrap compiler installed in the HOST_DIR. This mattered
for me as I build the toolchain and install it system-wide to use for
other builds, which refer to that toolchain as an external one.

I then changed the second patch to use HOST_GO_BOOTSTRAP_BUILDDIR
instead of GO_BOOTSTRAP_FINAL.

Does this make sense to have in buildroot?
