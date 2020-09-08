From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 8 Sep 2020 23:26:43 +0300
Subject: [Buildroot] [PATCH] package/cog: add a variant with WebKitGTK
In-Reply-To: <20200907162156.1458163-1-francois.perrad@gadz.org>
References: <20200907162156.1458163-1-francois.perrad@gadz.org>
Message-ID: <20200908232643.GD95366@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Francois,

On Mon, 07 Sep 2020 18:21:56 +0200 Francois Perrad <fperrad@gmail.com> wrote:

> wayland is useful only with wpewebkit.
> BR2_PACKAGE_WAYLAND is already selected by BR2_PACKAGE_WPEWEBKIT.
> backend options BR2_PACKAGE_COG_PLATFORM_* depend on BR2_PACKAGE_WPEWEBKIT.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/cog/Config.in | 11 +++++++----
>  package/cog/cog.mk    | 10 +++++++++-
>  2 files changed, 16 insertions(+), 5 deletions(-)

Let me put on my ?WPE/Cog developer hat? for a moment and let you know about
the roadmap for Cog: The WebKitGTK support will be eventually disappearing,
and Cog will be WPE-only, because the WebKitGTK support has been a bit of a
burden to maintain and has been broken a few times (and went unnoticed).

We are have in the back burner a big refactoring which will bring in support
for multiple web views to Cog (mainly) and a number of other improvements.
The development branch [1] where the work is progressing already removes the
WebKitGTK support, as a matter of fact.

Therefore I think adding support in Buildroot to compile Cog using WebKitGTK
is dead end, and in my opinion it would be better to not merge this patch.

Regards,
?Adri?n

---
[1] https://github.com/Igalia/cog/commits/devel/multiple-views
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200908/c46e1508/attachment.asc>
