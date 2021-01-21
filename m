From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:49:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump to version
 2.0.0
In-Reply-To: <20210112061025.33054-1-fido_max@inbox.ru>
References: <20210112061025.33054-1-fido_max@inbox.ru>
Message-ID: <20210121224924.129e3612@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Maxim,

On Tue, 12 Jan 2021 09:10:25 +0300
Maxim Kochetkov via buildroot <buildroot@busybox.net> wrote:

> Add PG13 patches.
> Debug builds (BR2_ENABLE_DEBUG=y) fails because of warnings, so disable WARNINGS_AS_ERRORS.
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  ...1-Allow-building-against-PG13-source.patch |  85 ++++
>  ...-wrapper-functions-for-base64-encodi.patch |  73 +++
>  ...003-Add-missing-utils-acl.h-includes.patch | 149 ++++++
>  ...support-for-PG13-List-implementation.patch | 473 ++++++++++++++++++
>  ...djust-code-to-PG13-list-sort-changes.patch |  59 +++
>  ...y-code-to-PG13-addRTEtoQuery-changes.patch |  37 ++
>  ...G13-convert_tuples_by_name-signature.patch |  65 +++
>  ...ode-to-PG13-tuple-conversion-changes.patch | 259 ++++++++++
>  ...hypertable-expansion-to-PG13-changes.patch |  88 ++++
>  ...decompress-code-to-Var-field-renames.patch |  41 ++
>  ...1-Adjust-jsonb_utils-to-PG13-changes.patch |  39 ++
>  ...AT_DropExpression-in-process_utility.patch |  48 ++
>  ...013-Adjust-copy-code-to-PG13-changes.patch |  34 ++
>  ...-PG13-command-completion-tag-changes.patch | 186 +++++++
>  ...-to-PG13-HEAP_INSERT_SKIP_WAL-change.patch |  51 ++
>  ...ode-to-PG13-planner_hook-signature-c.patch |  58 +++
>  ...just-code-to-deparse_context-changes.patch |  34 ++
>  .../timescaledb/0018-Update-compat.h.patch    |  27 +
>  package/timescaledb/timescaledb.hash          |   2 +-
>  package/timescaledb/timescaledb.mk            |   3 +-
>  20 files changed, 1809 insertions(+), 2 deletions(-)
>  create mode 100644 package/timescaledb/0001-Allow-building-against-PG13-source.patch
>  create mode 100644 package/timescaledb/0002-Add-compatibilty-wrapper-functions-for-base64-encodi.patch
>  create mode 100644 package/timescaledb/0003-Add-missing-utils-acl.h-includes.patch
>  create mode 100644 package/timescaledb/0004-Add-support-for-PG13-List-implementation.patch
>  create mode 100644 package/timescaledb/0005-Adjust-code-to-PG13-list-sort-changes.patch
>  create mode 100644 package/timescaledb/0006-Adjust-copy-code-to-PG13-addRTEtoQuery-changes.patch
>  create mode 100644 package/timescaledb/0007-Adjust-code-to-PG13-convert_tuples_by_name-signature.patch
>  create mode 100644 package/timescaledb/0008-Adjust-code-to-PG13-tuple-conversion-changes.patch
>  create mode 100644 package/timescaledb/0009-Adjust-hypertable-expansion-to-PG13-changes.patch
>  create mode 100644 package/timescaledb/0010-Adjust-decompress-code-to-Var-field-renames.patch
>  create mode 100644 package/timescaledb/0011-Adjust-jsonb_utils-to-PG13-changes.patch
>  create mode 100644 package/timescaledb/0012-Handle-AT_DropExpression-in-process_utility.patch
>  create mode 100644 package/timescaledb/0013-Adjust-copy-code-to-PG13-changes.patch
>  create mode 100644 package/timescaledb/0014-Adjust-code-to-PG13-command-completion-tag-changes.patch
>  create mode 100644 package/timescaledb/0015-Adjust-copy-to-PG13-HEAP_INSERT_SKIP_WAL-change.patch
>  create mode 100644 package/timescaledb/0016-Adjust-planner-code-to-PG13-planner_hook-signature-c.patch
>  create mode 100644 package/timescaledb/0017-Adjust-code-to-deparse_context-changes.patch
>  create mode 100644 package/timescaledb/0018-Update-compat.h.patch

Thanks for the patch. I have applied, even though it is really annoying
to carry those 18 patches. Hopefully they will be accepted upstream in
the near future.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
