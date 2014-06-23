From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 23 Jun 2014 23:13:42 +0200
Subject: [Buildroot] [PATCH 2/2] graph-depends: remove unnecessary
 redirect of stderr
In-Reply-To: <20140623204230.GA3572@free.fr>
References: <1403554284-4935-1-git-send-email-arnout@mind.be>
 <1403554284-4935-2-git-send-email-arnout@mind.be>
 <20140623204230.GA3572@free.fr>
Message-ID: <CAHXCMM+RVG=AUAgBWEX9CTmTaPEbZGGrQzaoTNqaU5TNssSaRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Yann, all,

On Mon, Jun 23, 2014 at 10:42 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Arnout, All,
>
> On 2014-06-23 22:11 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> It hides any error messages reported by make.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> Not sure what the test-case for that one would be, but it looks sane.

A test-case is when checking the graph-depends script using:
----
$ python3 ./support/script/graph-depends -p <foo>
Getting dependencies for ['<foo>']
Error getting dependencies ['<foo>']
----
after a rebase (and with some legacy option selected), sadly fails
with no clue at all in the output to help understanding what is wrong
:-(
I had to fire up pdb ;-)

But that true, who else uses the graph-depends script outside the BR
make wrapper? ;-)

>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Samuel Martin <s.martin49@gmail.com>
Tested-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
