From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 22 Jan 2013 18:12:49 +0100
Subject: [Buildroot] [RFC v1 01/14] Add a new "src" directory in the
	output directory
In-Reply-To: <20130122174902.3f2eca8b@skate>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1436311.zC6hLLIaar@sagittae> <20130122174902.3f2eca8b@skate>
Message-ID: <2395397.i0MApMWjWq@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tuesday 22 January 2013 17:49:02 Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
> 
> On Tue, 22 Jan 2013 11:15:11 +0100, J?r?me Pouiller wrote:
> > Hmm... If source is not shared across builds, what is advantage of build
> > out of sources?
> > 
> > I see two advantages:
> >   - No duplication of source between host and target. But finaly, only a
> >   few
> > 
> > (and small) package are concerned. Shall we care about this?
> > 
> >   - To make build of a package outside of Buildroot easier. In this case,
> >   did
> > 
> > you consider to build in a subdirectory of source? It does not allow to
> > share source between host and target but may be sufficient and may solve
> > a bunch of questions.
> 
> This last point is the main reason. For now, the LINUX_OVERRIDE_SRCDIR
> mechanism is barely usable because it does a complete rsync of the
> Linux source tree, which is very annoying. So, switching all packages
> to out of tree build sounds like an interesting solution.
And what about building in a subdirectory of source directory ? 

[...]
> Remember, simplicity of use is a *key* point of Buildroot. We are very
> attentive about this.
Ok, I share your point of view about simplicity. 

Regards,

-- 
J?r?me Pouiller
