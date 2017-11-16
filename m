From: Christian Stewart <christian@paral.in>
Date: Thu, 16 Nov 2017 18:30:33 +0000
Subject: [Buildroot] go: -a bug fixed in 1.10
Message-ID: <CA+h8R2r=Mo9nuyre8xiXHDh3D__LKsK6FwC6DfSzYjj8CKosGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Just a FYI for Go 1.10:

The go build command now detects out-of-date packages purely based on the
content of source files, specified build flags, and metadata stored in the
compiled packages. Modification times are no longer consulted or relevant.
The old advice to add -a to force a rebuild in cases where the modification
times were misleading for one reason or another (for example, changes in
build flags) is no longer necessary: builds now always detect when packages
must be rebuilt. (If you observe otherwise, please file a bug.)

I believe we addressed this bug in the Go package by adding -a and touching
the source tree to update mtime. I don't think this is necessary anymore as
of 1.10.

This email is intended to be a note for future reference, once 1.10 is
released.

Best,
Christian Stewart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171116/5181d411/attachment.html>
