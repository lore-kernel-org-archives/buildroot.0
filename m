From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 13 Sep 2010 10:42:31 +0200
Subject: [Buildroot] [PATCH 5/8] Use the normal download method for
 Tremor
In-Reply-To: <91f2599d9b9f069f719f5577ae44d987ccd58649.1284360382.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284360382.git.thomas.petazzoni@free-electrons.com>
	<91f2599d9b9f069f719f5577ae44d987ccd58649.1284360382.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1284367351.1742.29.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

will this new code still try to access a tarball in the dl directory and
then try to get a tarball from the primary mirror before it actually
tries to get the snapshot from the SVN repository?

IMO it is very important that it continues to work that way. I don't
want our nightly builds to pull snapshots from the SVN repository over
and over again. This wastes bandwidth, slows down the builds and breaks
the build every so often (if the SVN server is unreachable).


Sven


-- 
Sven Neumann
Head of Software Development

RAUMFELD GmbH | Reichenberger Str. 124 | 10999 Berlin | Germany
Tel: +49.30.340.60.98.0 | Fax: +49.30.340.60.98.99 | s.neumann at raumfeld.com
