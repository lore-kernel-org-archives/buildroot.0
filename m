From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 9 Oct 2019 19:03:29 +0200
Subject: [Buildroot] [PATCH v2 7/9] package/netopeer2-keystored: add
 package
In-Reply-To: <20191009155325.GU10860@scaer>
References: <20191009112656.21232-1-heiko.thiery@gmail.com>
 <20191009112656.21232-8-heiko.thiery@gmail.com>
 <20191009141235.016e4b23@windsurf>
 <CAEyMn7a2w8vXSqHHmHtKmkn8okGVdOq=XSsbRaYtG_bOJ6T0hA@mail.gmail.com>
 <20191009153454.1f5f3e09@windsurf> <20191009155325.GU10860@scaer>
Message-ID: <CAEyMn7YagOvss5TYDpZUvctz1xAiw=A72MZjj+Tw9gvjm9h35A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> > So we would have to do the CMake configuration/build/install steps
> > manually, as the cmake-package infrastructure only deals with a single
> > top-level CMake build infrastructure, which netopeer2 doesn't have.
> >
> > In the light of this in the end, perhaps it makes sense to have three
> > packages like you did. It kind of reflects the fact that even though
> > they are stored in the same Git repo, they are three independent
> > components each with its own build system.
>
> Yes.
>
> And since they do share the same source tree, we really want to download
> it only once:
>
>     NETOPEER2_KEYSTORED_DL_SUBDIR = netopeer2
>
> (similarly for the other two packages, of course).

does this mean we still have 3 packages but 2 of them use the download
of e.g. netopeer2-server as the "master" package?
