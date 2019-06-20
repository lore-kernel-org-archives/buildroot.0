From: David Barbion <davidb@230ruedubac.fr>
Date: Thu, 20 Jun 2019 22:48:34 +0200
Subject: [Buildroot] [Bug 11776] qt5webengine 5.12.2 build failed with
 arm toolchain and linaro toolchain
In-Reply-To: <bug-11776-163-lMbxwbn8ft@https.bugs.busybox.net/>
References: <bug-11776-163@https.bugs.busybox.net/>
 <bug-11776-163-lMbxwbn8ft@https.bugs.busybox.net/>
Message-ID: <96dbe5b3-a223-bfa4-503a-51badb255473@230ruedubac.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Absolutely. It must a commit between 2018.11.2 (working) and 2019.05
(not working).

I made another test with the minimum selected packages plus
qt5webengine, leaving all options by default and it gives the same result.

If anyone in the list know how those ninja files are created, please let
me know.

David.

On 19/06/2019 22:20, bugzilla at busybox.net wrote:
> https://bugs.busybox.net/show_bug.cgi?id=11776
>
> --- Comment #2 from fazibear at gmail.com ---
> Hello,
>
> For sure it's a bug related to -isystem` bug. It was fixed earlier but maybe
> something changed. 
>
> https://github.com/buildroot/buildroot/commit/3a0ed5d25e26cb2ec99a1da077c9dcfea67b0ecc 
>
> Removing -isystem <path> lines from ninja file when <path> is the path to your
> toolchain include dir make it works. But ninja files are generated.
>
> regards,
>
