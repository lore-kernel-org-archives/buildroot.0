From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jan 2013 18:16:40 +0100
Subject: [Buildroot] [RFC v1 01/14] Add a new "src" directory in the
 output directory
In-Reply-To: <4120429.ljLJ1sjWCA@sagittae>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1358725943-31485-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <4120429.ljLJ1sjWCA@sagittae>
Message-ID: <20130121181640.5ea23edd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Mon, 21 Jan 2013 14:47:22 +0100, J?r?me Pouiller wrote:

> IMHO, $(SRC_DIR) should be in $(TOPDIR) to be shared between
> different configurations. In add $(SRC_DIR) have to customizable in
> case I would like to clearly separate two projects.

I have indeed thought about making the source code shareable across
rebuilds and across projects, but since we apply patches to the source
code, it seems a bit complicated to do in a reliable way.

What happens when you bump your Buildroot version and the patches for a
given package change? You would have to manually clean up the source
directories. Not sure we want to do that, at least for now, but the
opinion of others would be interesting here.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
