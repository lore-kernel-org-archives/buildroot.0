From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Apr 2018 10:44:00 +0200
Subject: [Buildroot] [PATCH 1/2] website: footer.html: use 1.7.1 release
 of clipboard.js
In-Reply-To: <20180427195017.18344-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 27 Apr 2018 21:50:16 +0200")
References: <20180427195017.18344-1-peter@korsgaard.com>
Message-ID: <87k1sryb3j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The clipboard javascript code causes an error:
 > Uncaught TypeError: Illegal constructor
 >     at buildroot.js:58

 > Which is caused by a recent change in upstream clipboard.js:

 > https://github.com/zenorocha/clipboard.js/releases/tag/v2.0.0

 > Changes constructor from new Clipboard() to new ClipboardJS()

 > The issue was that we were using the master version of clipboard.js instead
 > of a specific release.  Fix it by using the 1.7.1 version (latest release
 > before the constructor change) instead.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 >  docs/website/footer.html | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/docs/website/footer.html b/docs/website/footer.html
 > index 279c8b1b5c..60a8872f77 100644
 > --- a/docs/website/footer.html
 > +++ b/docs/website/footer.html
 > @@ -1,6 +1,6 @@
 >  	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 >  	<script src="https://oss.maxcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 > -	<script src="https://cdn.rawgit.com/zenorocha/clipboard.js/master/dist/clipboard.min.js"></script>
 > +	<script src="https://cdn.rawgit.com/zenorocha/clipboard.js/v2.0.0/dist/clipboard.min.js"></script>

Ehh, this was naturally meant to be v1.7.1, I forgot to save muy
buffer. I've fixed it now.

-- 
Bye, Peter Korsgaard
