From: Jeroen Roovers <jer@airfi.aero>
Date: Mon, 3 Oct 2016 13:44:15 +0200
Subject: [Buildroot] [PATCH v3 2/2] couchdb: New package.
In-Reply-To: <l9i9cdxqle.ln2@ID-313208.user.individual.net>
References: <0dc17f18-b259-a618-67f3-099fd6ef0897@green-communications.fr>
 <1467800649-22119-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <1467800649-22119-2-git-send-email-nicolas.cavallari@green-communications.fr>
 <l9i9cdxqle.ln2@ID-313208.user.individual.net>
Message-ID: <CANCHnQrDJQ7Ke=wQU7hWPnOZTM7ruF-KbCber0KhBsMQkrhccQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have been using CouchDB 1.6.1 in operation for a long time now. I have
patches that make CouchDB use Erlang OTP 19.0 for a while now and patched
in OTP 18 support more than a year ago, and that has always worked with no
problems.

If you care to look at CouchDB "included" packages, for instance snappy and
mochiweb, you'll see that even in CouchDB 2.0 they use some ancient
versions when they really shouldn't. So I am not advising you to patch
CouchDB to use newer versions of its dependencies, but that I have good
results with newer OTP, and that CouchDB development appears to be rather
conservative in what they want to support.

If you're interested in my CouchDB/buildroot patches, let me know.


Kind regards,
     jer


On 3 October 2016 at 10:43, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Hi,
>
> Am Wed, 06 Jul 2016 12:24:09 +0200 schrieb Nicolas Cavallari:
>
> > +     select BR2_PACKAGE_ERLANG
>
> the elrang version provided by buildroot is detected as incompatible with
> couchdb 1.6.1:
>
> checking Erlang version compatibility... detected Erlang version:
> 7.3.0...configure: error: The installed Erlang version must be >= R14B
> (erts-5.8.1) and =< 17 (erts-6.0) major_version does not match
>
> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161003/67655c36/attachment.html>
