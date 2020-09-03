From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 15:58:10 +0200
Subject: [Buildroot] [RFC PATCH v1 1/1] package/pkg-golang: download
 deps to vendor tree if not present
In-Reply-To: <CAH=K+6mTVOJ97E78HLH16mTVDksnLc+2oVxNi2fqdCseuiuy8Q@mail.gmail.com>
References: <20200831062335.1105977-1-christian@paral.in>
 <20200831070800.GN14354@scaer>
 <CAK714xKp0H5HEv5bp1bjDumZff6+cC41cs=exZk8bKuZTCV2vQ@mail.gmail.com>
 <20200903135714.68ed2e22@windsurf.home>
 <CAH=K+6mTVOJ97E78HLH16mTVDksnLc+2oVxNi2fqdCseuiuy8Q@mail.gmail.com>
Message-ID: <20200903155810.22861b0b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 3 Sep 2020 08:01:27 -0500
Sam Voss <sam.voss@collins.com> wrote:

> > Question: for the dependencies, instead of having a single tarball for
> > all of them, would there be a way of having separate tarballs for each
> > dependency that gets pulled by "go mod" or "cargo" ? If so, then we
> > could perhaps be able to teach the package which parts of the package
> > are proprietary (including the proprietary dependencies) and which
> > parts are open-source and under which license.  
> 
> I don't exactly know, but to your point I know it pulls them into
> correctly-named folders, however no version string attached:
> 
> VENDOR/ws2_32-sys/Cargo.toml

So potentially we could tarball independently each dependency, perhaps
in a tarball named:

<pkgname>-<pkgversion>-<dependencyname>.tar.gz

where <dependencyname> here would be "ws2_32-sys".

The question is then how we can associate the licenses to each
dependency. Again, I don't think it's worth tackling at this moment.

> > Could you submit your patch series ? Did you fix the issues that we
> > pointed out in the review of Patrick's series ?  
> 
> I did not change Patrick's series at all, built a new change-set on
> top of it. I will have to go back and integrate them together, and I
> can take a look at the issues with him in the meantime.

Yes, if you can re-integrate your improvements within the patches from
Patrick and submit an updated series, it would be great.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
