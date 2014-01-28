From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Tue, 28 Jan 2014 21:24:47 +0100
Subject: [Buildroot] full rebuild and errors
In-Reply-To: <52E6945C.40202@mind.be>
References: <52E4FA8C.7060109@gmail.com> <52E6945C.40202@mind.be>
Message-ID: <52E8120F.7080805@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 27/01/2014 18:16, Arnout Vandecappelle ha scritto:
>  I guess you mean
>
> make clean all


Yes of course, I apologize for the typo.

> This smells like it could be a ccache issue. Is it possible that you 
> had a major upgrade to your compiler since the first time you made a 
> build?

It's very unlikely because I have a Debian shell and I didn't update 
anything during the day (just few hours between the two compilations).

> Can you try with
>
> make clean all BR2_CCACHE=
>
> (or just edit your config to disable ccache).


Yeah! It did the trick!
I can't imagine it was a ccache problem because I deleted the whole 
directory and cloned again the repository from scratch - I thought it 
should reset anything to the initial state, my fault!

Thank you
Mark
