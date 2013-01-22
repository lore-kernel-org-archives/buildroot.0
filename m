From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 22 Jan 2013 11:15:11 +0100
Subject: [Buildroot] [RFC v1 01/14] Add a new "src" directory in the
	output directory
In-Reply-To: <20130121181640.5ea23edd@skate>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <4120429.ljLJ1sjWCA@sagittae> <20130121181640.5ea23edd@skate>
Message-ID: <1436311.zC6hLLIaar@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 21 January 2013 18:16:40 Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
> 
> On Mon, 21 Jan 2013 14:47:22 +0100, J?r?me Pouiller wrote:
> > IMHO, $(SRC_DIR) should be in $(TOPDIR) to be shared between
> > different configurations. In add $(SRC_DIR) have to customizable in
> > case I would like to clearly separate two projects.
> 
> I have indeed thought about making the source code shareable across
> rebuilds and across projects, but since we apply patches to the source
> code, it seems a bit complicated to do in a reliable way.
Hmm... If source is not shared across builds, what is advantage of build out 
of sources? 

I see two advantages:
  - No duplication of source between host and target. But finaly, only a few 
(and small) package are concerned. Shall we care about this?
  - To make build of a package outside of Buildroot easier. In this case, did 
you consider to build in a subdirectory of source? It does not allow to share 
source between host and target but may be sufficient and may solve a bunch of 
questions.

> What happens when you bump your Buildroot version and the patches for a
> given package change? You would have to manually clean up the source
> directories. Not sure we want to do that, at least for now, but the
> opinion of others would be interesting here.
Currently, when you bump your version of Buildroot, you have to clean all. 
Buildroot may provide a rule to also cleaning source directory. 



Regards,

-- 
J?r?me Pouiller
