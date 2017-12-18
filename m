From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 11:31:22 +0100
Subject: [Buildroot] [PATCH v8 0/9] Add support for the Rust programming
 language
In-Reply-To: <706201859.95242518.1513592711039.JavaMail.root@zimbra32-e6>
References: <20171218075439.7d3c37c8@windsurf>
 <706201859.95242518.1513592711039.JavaMail.root@zimbra32-e6>
Message-ID: <20171218113122.76db1f02@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Dec 2017 11:25:11 +0100 (CET), Eric Le Bihan wrote:

> The patch which adds the package to build Rust from source provides a 
> patch to fix a problem involving files ending with *.orig.
> 
> As the Rust compiler is built using Cargo, the tarball contains vendored
> versions of the crates (e.g. src/vendor/backtrace-sys). Each crate 
> contains a file named Cargo.toml.orig. An associated file named
> .cargo-checksum.json will contain a checksum for Cargo.toml.orig (and
> the other source files).
> 
> But support/scripts/apply-patches.sh will delete the Cargo.toml.orig 
> files. This will cause the build to fail, as Cargo will not be able to 
> find the file and verify the checksum.
> 
> So the patch included in the rust package removes all Cargo.toml.orig 
> entries from the affected .cargo-checksum.json. As these files list all
> the source files, this results in a huge patch.
> 
> Besides, as these are non-indented JSON files, some are one-lined and 
> thus the 998 characters limit enforced by git-send-email is exceeded.
> 
> So, if there a way to stop support/scripts/apply-patches.sh from pruning
> Cargo.toml.orig files, so this patch can be dropped?

Do we really have a reason to remove *.orig files in
apply-patches.sh ? .orig backup files are only produced if -b is passed
to patch, which we are not using.

Are there other cases where .orig files are produced by patch *and* we
really need to remove them?

Peter, Arnout, Yann?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
