From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 6 Feb 2019 04:03:09 -0600
Subject: [Buildroot] openssl 1.1.x deprecated option
Message-ID: <CANQCQpYYxbhNZvvmzi7vjd+ZuWtxKqMZVxAwZwsjd-OzkQsgDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was thinking about  how to manage the risk of a version bump vs
backport patches and found another possible solution.

For openssl 1.1.x there are a series of deprecated APIs for items like
EVP_MD_CTX* which are now disabled and seem to result in 1/2 of the
failures. Would we entertain on some packages adding the libopenssl
"enable-deprecated"  configure option [1] so that it re-enables those
options (could do this like we currently do with a kconfig package = y
condition in the libopenssl.mk)?   Both mongodb and sqlcipher which
are currently failing should be resolved with this approach.

Is this worth testing out / proposing?

Matt

[1] Details on the option  - https://github.com/openssl/openssl/issues/4985
