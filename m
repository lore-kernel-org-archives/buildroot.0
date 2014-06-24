From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 24 Jun 2014 15:05:56 +0200
Subject: [Buildroot] [RFCv1 0/4] Generating a graph of the size
 installed by each package
In-Reply-To: <1402177567-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1402177567-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <53A977B4.70205@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

sorry for jumping in late, but I have a question about this patchset.

Thomas Petazzoni wrote:
> Hello,
>
> I gave a training this week, and one of the question I had was how to
> analyze the size of the things that are present on the root
> filesystem. And I thought that Buildroot was lacking a tool to help
> with this. Therefore, the following set of commits implement a script
> that generates a pie chart of the size contribution of each package to
> the target root filesystem.

Nice feature!

>
> To see an example of the generated pie chart, see:
>
>    http://free-electrons.com/~thomas/pub/buildroot/graph-size.pdf
>
> The implementation consists in adding a global instrumentation hook
> that registers which files are installed by each package. A limitation
> of the current implementation is that when a file is installed by a
> package A and then overriden by package B, the mechanism will assume
> the file was installed by package A. Suggestions to welcome on how to
> solve this in a reasonably simple way.

It's very well possible that I'm missing something, but I don't get why
you need to save the list of all installed files.

Can't you just save the whole rootfs size before and after installation?
It can be simply computer by 'du -bs $(TARGET_DIR)', and it's way
easier to parse later. It would also take into account the change of
size for overwritten files, for free.

Of course your approach collects more information, but I don't see
these extra info used in the final graph.

-- 
Luca
