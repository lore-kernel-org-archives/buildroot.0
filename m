From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 16 Sep 2015 14:58:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/sudo: disable use of stack
 protector when not available
In-Reply-To: <CA+BsyQ66bdvxv1b11NNFAbenC4snpdoB2BajsM5COQB5uCQ75A@mail.gmail.com>
References: <1442342953-20312-1-git-send-email-brendanheading@gmail.com>
 <20150915233014.27cc4a34@free-electrons.com>
 <CA+BsyQ7-YdWiOQ9E0X_+vppuB0hNdVPNV7kai9UW+1Kz5G8s3w@mail.gmail.com>
 <20150915234417.4658d78e@free-electrons.com>
 <CA+BsyQ4UcfDLxGK5+_AbdVcngzUM_fn=ab6fxHOLFp3pepDi7Q@mail.gmail.com>
 <CA+BsyQ66bdvxv1b11NNFAbenC4snpdoB2BajsM5COQB5uCQ75A@mail.gmail.com>
Message-ID: <CA+BsyQ5NiTyR0NqXSQvWaBzVPsv1wWeXGX=Y4d7YbAFCJCRwow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I'll try to find out what's going on tomorrow.

Thomas,

I've found that the SSP detection seems to go wrong with a buildroot
toolchain and when uclibc-ng is in use. regular uclibc and glibc
appear work fine.

I'm looking in and around the uclibc feature checking. It smells as if
there's probably a difference with uclibc-ng which is not being
accounted for, but I've not spotted it just yet.

Brendan
