From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 17 Nov 2012 10:59:41 -0300
Subject: [Buildroot] [PATCH] Warn the user about the usage of
 output/target as the root filesystem
In-Reply-To: <1353160334-30174-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1353160334-30174-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <50A7984D.2050602@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/17/2012 10:52 AM, Thomas Petazzoni wrote:

> A very common mistake done by our users is that they use
> output/target/ directory as their root filesystem. Even though this is
> loudly documented in our Buildroot manual, people don't read
> documentation, so it is not sufficient.
> 
> This patch adds a text file named
> output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM which explains why
> output/target isn't appropriate to use as the root filesystem. The
> process is:
> 
>  * At the beginning of the build, right after the skeleton has been
>    copied, support/misc/target-dir-warning.txt is copied to
>    output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
> 
>  * In the filesystem images creation code, this file is removed before
>    launching fakeroot, and restored right after that, so that this
>    file is not present in the generated root filesystem images.
> 
> Note that the file has not been added to the default skeleton for two
> reasons:
> 
>  * It would have annoying to have in our source tree a file named in
>    capital letters inside system/skeleton/
> 
>  * The proposed way works even if the user uses a custom skeleton.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Juha Lumme <juha.lumme@gmail.com>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
