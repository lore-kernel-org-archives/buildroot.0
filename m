From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 19:25:45 +0200
Subject: [Buildroot] [PATCH] libevent: use github call
In-Reply-To: <CAGduivydE4+6whagL3qf8sp81rwT_70GL21FLavy5Z5vb68R=g@mail.gmail.com>
References: <1413129607-9134-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20141012181720.2b5dd0ee@free-electrons.com>
 <CAGduivwSZEN-yMsGr2xpJZudy0PxcUhkxkOqmmpXLE4YGmBFtA@mail.gmail.com>
 <20141012184649.6d7ec0d7@free-electrons.com>
 <CAHXCMM+=Os_NwrLSkYw+DFYZxz8K5STqq_EwAg3ZXyF4sT6_EA@mail.gmail.com>
 <CAGduivxcJgxa7N2fDdHsdnO5wJQVM1ydPwFBegV-Qxn_7fGs-A@mail.gmail.com>
 <20141012190804.6d3bc3f1@free-electrons.com>
 <CAGduivydE4+6whagL3qf8sp81rwT_70GL21FLavy5Z5vb68R=g@mail.gmail.com>
Message-ID: <20141012192545.46b6a914@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 12 Oct 2014 19:22:43 +0200, Maxime Hadjinlian wrote:

> To put everything cleary in a mail:
> 
> When a maintainer do a release from github, there's two possibilities:
> Either you don't upload a file, then the tarball you download is
> generated from the tag.
> 
> Or you upload a file, and then the tarball, is *NOT* generated, it's
> the file that you uploaded.
> 
> Since the hepers, will call the http URL of github (and not doing a
> git clone), for me the github helper is used for any generated
> tarball.
> *BUT* if the releases is a manually uploaded file, then we have to
> uses the http link and not the helper. I'd recommend to put a comments
> on each one theses cases.
> 
> In the case of libevent, the link from the website points to the
> release on github, which is a generated tarball, not an uploaded one.
> So the uses of the helper is perfectly fine here.
> 
> Hope I gave enough details here, maybe this should be put in the
> manual ? Don't know if it's really usefull.

Makes sense, especially when you add the information that the github
helper doesn't provide a git URL that will lead to a git clone, but a
http URL that will lead to wget-ing a tarball.

So, fine with using the github helper here.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
