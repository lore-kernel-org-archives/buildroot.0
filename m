From: Simon Marchi <simon.marchi@polymtl.ca>
Date: Wed, 5 Aug 2015 10:54:56 -0400
Subject: [Buildroot] [PATCH] ola: Add patch to fix linking issue
In-Reply-To: <55C1C210.4040700@green-communications.fr>
References: <1438748380-5528-1-git-send-email-simon.marchi@polymtl.ca>
 <55C1C210.4040700@green-communications.fr>
Message-ID: <CAFXXi0mAPmj9D3qoTBLjybUjMsHeh_W3TUc_Ck946f7OMD-cFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 August 2015 at 03:58, Nicolas Cavallari
<Nicolas.Cavallari@green-communications.fr> wrote:
> No, the actual implementation is still generated.  However, the build
> system pass the -fvisibility-inlines-hidden option, so it is not
> exported ...

Ahh thanks for the tip.  I should have looked at the compiler flags in
the first place, this one would have been obvious.

> This bug should be present in the whole library, i'm surprised that
> only break in this case.

My guess is it's the only method that has this problem that is called
from a shared library.

In any case, do you think that making the implementation non-inline is
the right fix here?
