From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jun 2014 22:11:00 +0200
Subject: [Buildroot] [RFCv1 0/4] Generating a graph of the size
 installed by each package
In-Reply-To: <53A9D769.20000@lucaceresoli.net>
References: <1402177567-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <53A977B4.70205@lucaceresoli.net> <53A9A7E2.7040906@mind.be>
 <53A9D769.20000@lucaceresoli.net>
Message-ID: <20140624221100.4d6a2a56@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Tue, 24 Jun 2014 21:54:17 +0200, Luca Ceresoli wrote:

> >   The reason is explained a bit further in that cover letter: we only do
> > stripping and removing of redundant stuff in the finalize step, so calculating
> > the size before that doesn't make much sense.
> 
> Aaah, yes, stripping! Of course! I was sure there is a good reason...

Well really it's not only stripping. It's all the things that
target-finalize is doing: stripping of course, but also removing .h
files, .a files, documentation, unneeded locales, and more.

Therefore, my approach was more to really only at the files that are in
output/target/ (and their size) at the end of the build and then try to
match the packages they are coming from.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
